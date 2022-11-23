package ass3;
//Naive implementation of Barrier class
//Mandatory assignment 3
//Course 02158 Concurrent Programming, DTU, Fall 2022

//Hans Henrik Lovengreen     Oct 25, 2022

class NaiveBarrierNoSync extends Barrier {

    int arrived = 0;
    boolean active = false;

    public NaiveBarrierNoSync(CarDisplayI cd) {
        super(cd);
    }

    @Override
    public void sync(int no) throws InterruptedException {
        if (!active)
            return;

        arrived++;
        System.out.println(no + " " + arrived);

        // prob 2.2 all 9 cars rendered waiting
        //Thread.sleep(3000);

        synchronized(this) {
            // prob 2.3
            Thread.sleep(500);
            System.out.println("inside: " + no + " " + arrived);
            if (arrived < 9) {
                wait();
            } else {
                arrived = 0;
                notifyAll();
            }
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
        synchronized(this) {
            notifyAll();
        }
    }


    @Override
    // May be (ab)used for robustness testing
    public synchronized void set(int k) {
        notify();
    }

}

