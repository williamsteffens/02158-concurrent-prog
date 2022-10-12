/* Promela model of the Passing-the-Baton MultiAlley Solution */
/* Deliverable for Problem 5+ */

#define N 8

#define eSemP atomic{ eSem > 0 -> eSem-- }
#define eSemV atomic{ eSem++ }
#define upSemP atomic{ upSem > 0 -> upSem-- }
#define upSemV atomic{ upSem++ }
#define downSemP atomic{ downSem > 0 -> downSem-- }
#define downSemV atomic{ downSem++ }

#define incUp t = up; up = t + 1
#define decUp t = up; up = t - 1
#define incDown t = down; down = t + 1
#define decDown t = down; down = t - 1
#define incDUp t = dup; dup = t + 1
#define decDUp t = dup; dup = t - 1
#define incDDown t = ddown; ddown = t + 1
#define decDDown t = ddown; ddown = t - 1

bool eSem = 1, upSem = 0, downSem = 0;
short up = 0, down = 0, dup = 0, ddown = 0;
byte inAlleyUp = 0, inAlleyDown = 0;



inline Enter(no) {
    if  
        :: (no < 4) -> 
            // atomic {(up == 0) -> down++};
            eSemP;
            if 
                :: (up > 0) -> 
                    incDDown;
                    eSemV;
                    downSemP;

                :: else -> skip
            fi;
            incDown;
            // SIGNAL 
            if 
                :: (ddown > 0) ->
                    decDDown;
                    downSemV

                :: else -> eSemV
            fi

        :: else -> 
            // atomic {(down == 0) -> up++};
            eSemP;
            if 
                :: (down > 0) -> 
                    incDUp;
                    eSemV;
                    upSemP;

                :: else -> skip
            fi;
            incUp;
            //SIGNAL 
            if 
                :: (dup > 0) -> 
                    decDUp;
                    upSemV

                :: else -> eSemV 
            fi

    fi
}

inline Leave(no) {
    if  
        :: (no < 4) ->
            // down--;
            eSemP;
            decDown;
            // SIGNAL
            if 
                :: (down == 0 && dup > 0) -> 
                    decDUp;
                    upSemV

                :: else -> eSemV
            fi

        :: else ->
            // up--;
            eSemP;
            decUp;
            // SIGNAL
            if 
                :: (up == 0 & ddown > 0) -> 
                    decDDown;
                    downSemV

                :: else -> eSemV
            fi

    fi
}



active [N] proctype Car () {
    short t;  /* var used for non-atomic inc and dec */

	do  :: skip; /* First statement is a dummy to allow a label at start */ 
        entry:	
            Enter(_pid);

        /* Critical section / Alley */
        critAlley:
            atomic{ 
                if 
                    :: (_pid < 4)   -> inAlleyDown++
                    :: else         -> inAlleyUp++
                fi
            }
            assert(!(inAlleyUp && inAlleyDown));
            atomic{ 
                if 
                    :: (_pid < 4)   -> inAlleyDown--
                    :: else         -> inAlleyUp--
                fi
            }

        exit: 
            Leave(_pid);

            /* Non-critical section (may or may not terminate) */
        do :: true -> skip :: break od
    od;
}

active proctype Check_Binary_Sem()
{
	/* Check split binary semaphore principle holds */
	assert(!(eSem && upSem && downSem))
}