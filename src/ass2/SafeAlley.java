package ass2;//Skeleton implementation of a safe Alley class
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2022

//Hans Henrik Lovengreen     Sep 26, 2022

public class SafeAlley extends Alley {

    protected SafeAlley() {
        
    }

    /* Block until car no. may enter alley */
    public void enter(int no) throws InterruptedException {
        if (no < 5) {
            
        } else {
            
        }

     }

    /* Register that car no. has left the alley */
    public void leave(int no) {
        if (no < 5) {

        } else {

        }
    }

}
