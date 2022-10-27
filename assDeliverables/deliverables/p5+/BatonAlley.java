//Skeleton implementation of an Alley class  using passing-the-baton
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2022

//Hans Henrik Lovengreen     Sep 26, 2022

public class BatonAlley extends Alley {

    int up, down, delayUp, delayDown;
    Semaphore eSem, upSem, downSem;

    protected BatonAlley() {
        up = 0; down = 0;
        delayUp = 0; delayDown = 0;
        eSem    = new Semaphore(1);
        upSem   = new Semaphore(0);
        downSem = new Semaphore(0);
    }

    /* Block until car no. may enter alley */
    public void enter(int no) throws InterruptedException {
        if (no < 5) {
            // <(up == 0) -> down++>
            eSem.P();
            if (up > 0) {
                ++delayDown;
                eSem.V();
                downSem.P();
            }
            ++down;
            // SIGNAL
            if (delayDown > 0) {
                --delayDown;
                downSem.V();
            }
            else {
                eSem.V();
            }
        }
        else {
            eSem.P();
            if (down > 0) {
                ++delayUp;
                eSem.V();
                upSem.P();
            }
            ++up;
            // SIGNAL
            if (delayUp > 0) {
                --delayUp;
                upSem.V();
            }
            else {
                eSem.V();
            }
        }

     }

    /* Register that car no. has left the alley */
    public void leave(int no) throws InterruptedException {
        if (no < 5) {
            eSem.P();
            --down;
            // SIGNAL
            if (down == 0 && delayUp > 0) {
                --delayUp;
                upSem.V();
            }
            else {
                eSem.V();
            }
        }
        else {
            eSem.P();
            --up;
            // SIGNAL
            if (up == 0 && delayDown > 0) {
                --delayDown;
                downSem.V();
            }
            else {
                eSem.V();
            }
        }

    }

}
