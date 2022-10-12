package ass2;
//Prototype implementation of Field class
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2022

//Hans Henrik Lovengreen     Sep 26, 2022

import java.util.Hashtable;

public class Field {

    Hashtable<Pos, Semaphore> ht;

    public Field() {
        ht = new Hashtable<>();
    }

    /* Block until car no. may safely enter tile at pos */
    public void enter(int no, Pos pos) throws InterruptedException {
        if (ht.containsKey(pos)) {
            ht.get(pos).P();
        }
        else {
            ht.put(pos, new Semaphore(1));
            ht.get(pos).P();
        }
    }

    /* Release tile at position pos */
    public void leave(Pos pos) {
        ht.get(pos).V();
    }

}
