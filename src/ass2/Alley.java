package ass2;
//Dummy implementation of Alley class
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2022

//Hans Henrik Lovengreen     Sep 26, 2022

public class Alley {

    protected Alley() { }

    public static Alley create() {
        return new MultiAlley2();                                     // Change to use desired implementation
    }

    /* Block until car no. may enter alley */
    public void enter(int no) throws InterruptedException { }

    /* Register that car no. has left the alley */
    public void leave(int no) throws InterruptedException { }
    
}
