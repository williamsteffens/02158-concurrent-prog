package ass2;//Simple implementation of Alley class
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2022

//Hans Henrik Lovengreen     Sep 26, 2022

public class MonoAlley extends Alley {

    Semaphore mutex;
    
    protected MonoAlley() {
        mutex = new Semaphore(1);
    }

    /* Block until car no. may enter alley */
    public void enter(int no) throws InterruptedException {
        mutex.P();
    }

    /* Register that car no. has left the alley */
    public void leave(int no) {
        mutex.V();
    }
    
}
