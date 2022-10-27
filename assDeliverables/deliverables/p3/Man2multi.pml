/* Promela model of the MultiAlley Implementation */
/* Deliverable for Problem 3 */

#define N 8

#define upSemP atomic{ upSem > 0 -> upSem-- }
#define upSemV atomic{ upSem++ }
#define downSemP atomic{ downSem > 0 -> downSem-- }
#define downSemV atomic{ downSem++ }

#define incUp t = up; up = t + 1
#define decUp t = up; up = t - 1
#define incDown t = down; down = t + 1
#define decDown t = down; down = t - 1

byte upSem = 1, downSem = 1;
short up = 0, down = 0;
byte inAlleyUp = 0, inAlleyDown = 0;



inline Enter(no) {
    if  
        :: (no < 4) -> 
            downSemP
            if 	
                :: (down == 0) -> upSemP 
				:: else -> skip 
			fi;
            incDown;
            downSemV
                  
        :: else -> 
            upSemP
            if 
                :: (up == 0) -> downSemP 
                :: else -> skip
            fi; 
            incUp;
            upSemV
    fi
}

inline Leave(no) {
    if  
        :: (no < 4) ->
            decDown;
            if  
                :: (down == 0) -> upSemV
                :: else -> skip
            fi;

        :: else ->
            decUp;
            if 
                :: (up == 0) -> downSemV 
                :: else -> skip
            fi;
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