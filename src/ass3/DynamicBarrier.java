package ass3;
//Implementation of dynamic Barrier class (skeleton)
//Mandatory assignment 3
//Course 02158 Concurrent Programming, DTU, Fall 2022

//Hans Henrik Lovengreen     Oct 25, 2022

class DynamicBarrier extends Barrier {

    int arrived = 0;
    boolean active = false;
    boolean OK = false;

    public DynamicBarrier(CarDisplayI cd) {
        super(cd);
    }

    @Override
    public void sync(int no) throws InterruptedException {
        if (!active)
            return;

        while(OK) {
            wait();
            if (!active)
                return;
        }
        arrived++;
        if (arrived == 9) {
            OK = true;
            notifyAll();
        }

        while(!OK) {
            wait();
            if (!active)
                return;
        }
        arrived--;
        if (arrived == 0) {
            OK = false;
            notifyAll();
        }
    }

    @Override
    public void on() {
        active = true;
    }

    @Override
    public void off() {
        active = false;
        arrived = 0;
        OK = false;
        notifyAll();
    }

    @Override
    /* Set barrier threshold */
    public void set(int k) {

    }

}

