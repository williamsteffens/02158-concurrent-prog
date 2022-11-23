package ass3;
//Implementation of a basic Barrier class (skeleton)
//Mandatory assignment 3
//Course 02158 Concurrent Programming, DTU, Fall 2022

//Hans Henrik Lovengreen     Oct 25, 2022

class SafeBarrier extends Barrier {

    int arrived = 0;
    boolean active = false;
    boolean carsPassing = false;

    public SafeBarrier(CarDisplayI cd) {
        super(cd);
    }

    @Override
    public synchronized void sync(int no) throws InterruptedException {
        if (!active)
            return;

        while (carsPassing)
            wait();

        arrived++;
        if (arrived < 9) {
            while (!carsPassing)
                wait();
        }
        else {
            carsPassing = true;
            notifyAll();
        }
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
        if (arrived > 0)
            carsPassing = true;
        notifyAll();
    }

    @Override
    // May be (ab)used for robustness testing
    public synchronized void set(int k) {
        notify();
    }

}

