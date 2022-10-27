/* Promela model of the coarse-grain MultiAlley Solution */
/* Deliverable for Problem 5+ */

#define N 8

#define upSemP atomic{ upSem > 0 -> upSem-- }
#define upSemV atomic{ upSem++ }
#define downSemP atomic{ downSem > 0 -> downSem-- }
#define downSemV atomic{ downSem++ }

#define incUp t = up; up = t + 1
#define decUp t = up; up = t - 1
#define incDown t = down; down = t + 1
#define decDown t = down; down = t - 1

short up = 0, down = 0;
byte inAlleyUp = 0, inAlleyDown = 0;



inline Enter(no) {
    if  
        :: (no < 4) -> 
            atomic {(up == 0) -> down++};     
        :: else -> 
            atomic {(down == 0) -> up++};
    fi
}

inline Leave(no) {
    if  
        :: (no < 4) ->
            down--;
        :: else ->
            up--;
    fi
}



active [N] proctype Car () {
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

//ltl fair0 { [] ( (Car[0]@entry) -> <>  (Car[0]@critAlley) ) } 
