package ass3;
//Implementation of a basic Barrier class supporting car removal (skeleton)
//Mandatory assignment 3
//Course 02158 Concurrent Programming, DTU, Fall 2022

//Hans Henrik Lovengreen     Oct 25, 2022

import java.util.Arrays;

class RemBarrier extends Barrier {

    int arrived = 0;
    boolean active = false;
    boolean carsPassing = false;
    int th = 9;
    boolean[] waiting = new boolean[th];
    
    public RemBarrier(CarDisplayI cd) {
        super(cd);
        Arrays.fill(waiting, false);
    }

    @Override
    public synchronized void sync(int no) throws InterruptedException {
        if (!active)
            return;

        while (carsPassing)
            wait();

        arrived++;
        if (arrived < th) {
            while (!carsPassing) {
                waiting[no] = true;
                wait();
            }
        }
        else {
            carsPassing = true;
            notifyAll();
        }
        waiting[no] = false;
        arrived--;

        if (arrived == 0) {
            carsPassing = false;
            notifyAll();
        }
    }

    @Override
    public synchronized void on() {
        active = true;
    }

    @Override
    public synchronized void off() {
        active = false;
        if (arrived > 0) {
            carsPassing = true;
            notifyAll();
        }
    }

    /* Add further methods as needed */
    public synchronized void removeCar(int no) {
        if (waiting[no]) {
            arrived--;
            waiting[no] = false;
        }
        th--;
        if (arrived == th) {
            carsPassing = true;
            notifyAll();
        }
    }

    public synchronized void restoreCar(int no) {
        th++;
    }

}
