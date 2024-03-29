package ass3;
//Implementation of CarControl class
//Mandatory assignment 3
//Course 02158 Concurrent Programming, DTU, Fall 2022

//Hans Henrik Lovengreen     Oct 25, 2022


import java.awt.Color;

class Conductor extends Thread {

    double basespeed = 7.0;          // Tiles per second
    double variation =  40;          // Percentage of base speed

    boolean inAlley = false;

    CarDisplayI cd;                  // GUI part
    
    Field field;                     // Field control
    Alley alley;                     // Alley control    
    RemBarrier remBarrier;                 // Barrier control

    int no;                          // Car number
    Pos startpos;                    // Start position (provided by GUI)
    Pos barpos;                      // Barrier position (provided by GUI)
    Color col;                       // Car  color
    Gate mygate;                     // Gate at start position

    Pos curpos;                      // Current position 
    Pos newpos;                      // New position to go to

    public Conductor(int no, CarDisplayI cd, Gate g, Field field, Alley alley, RemBarrier remBarrier) {

        this.no = no;
        this.cd = cd;
        this.field = field;
        this.alley = alley;
        this.remBarrier = remBarrier;
        mygate = g;
        startpos = cd.getStartPos(no);
        barpos   = cd.getBarrierPos(no);  // For later use

        col = chooseColor();

        // special settings for car no. 0
        if (no==0) {
            basespeed = -1.0;  
            variation = 0; 
        }
    }

    public synchronized void setSpeed(double speed) { 
        basespeed = speed;
    }

    public synchronized void setVariation(int var) { 
        if (no != 0 && 0 <= var && var <= 100) {
            variation = var;
        }
        else
            cd.println("Illegal variation settings");
    }

    synchronized double chooseSpeed() { 
        double factor = (1.0D+(Math.random()-0.5D)*2*variation/100);
        return factor*basespeed;
    }

    Color chooseColor() { 
        return Color.blue; // You can get any color, as longs as it's blue 
    }

    Pos nextPos(Pos pos) {
        // Get my track from display
        return cd.nextPos(no,pos);
    }

    boolean atGate(Pos pos) {
        return pos.equals(startpos);
    }

    boolean atEntry(Pos pos) {
        return (pos.row ==  1 && pos.col ==  1) || (pos.row ==  2 && pos.col ==  1) || 
               (pos.row == 10 && pos.col ==  0);
    }

    boolean atExit(Pos pos) {
        return (pos.row ==  0 && pos.col ==  0) || (pos.row ==  9 && pos.col ==  1);
    }

    boolean atBarrier(Pos pos) {
        return pos.equals(barpos);
    }

    public void run() {
        try {
            CarI car = cd.newCar(no, col, startpos);
            curpos = startpos;
            try {
                field.enter(no, curpos);
            } catch (InterruptedException e) {
                remBarrier.removeCar(no);
                return;
            }
            cd.register(car);

            while (true) {

                if (atGate(curpos)) {
                    try {
                        mygate.pass();
                    } catch (InterruptedException e) {
                        field.leave(curpos);
                        remBarrier.removeCar(no);
                        cd.deregister(car);
                        return;
                    }
                    car.setSpeed(chooseSpeed());
                }

                newpos = nextPos(curpos);

                try {
                    if (atBarrier(curpos)) remBarrier.sync(no);
                } catch (InterruptedException e) {
                    field.leave(curpos);
                    remBarrier.removeCar(no);
                    cd.deregister(car);
                    return;
                }

                try {
                    if (atEntry(curpos)) {
                        alley.enter(no);
                        inAlley = true;
                    }
                } catch (InterruptedException e) {
                    field.leave(curpos);
                    remBarrier.removeCar(no);
                    cd.deregister(car);
                    return;
                }

                try {
                    field.enter(no, newpos);
                } catch (InterruptedException e) {
                    if (inAlley)
                        alley.leave(no);
                    field.leave(curpos);
                    remBarrier.removeCar(no);
                    cd.deregister(car);
                    return;
                }

                try {
                    car.driveTo(newpos);
                } catch (InterruptedException e) {
                    if (inAlley)
                        alley.leave(no);
                    field.leave(newpos);
                    field.leave(curpos);
                    remBarrier.removeCar(no);
                    cd.deregister(car);
                    return;
                }

                field.leave(curpos);
                if (atExit(newpos)) {
                    alley.leave(no);
                    inAlley = false;
                }

                curpos = newpos;
            }

        } catch (Exception e) {
            cd.println("Exception in Conductor no. " + no);
            System.err.println("Exception in Conductor no. " + no + ":" + e);
            e.printStackTrace();
        }
    }

}

public class CarControl implements CarControlI{

    CarDisplayI cd;           // Reference to GUI
    Conductor[] conductor;    // Car controllers
    Gate[] gate;              // Gates
    Field field;              // Field
    Alley alley;              // Alley
    RemBarrier remBarrier;       // Barrier

    public CarControl(CarDisplayI cd) {
        this.cd = cd;
        conductor = new Conductor[9];
        gate = new Gate[9];
        field = new Field();
        alley = Alley.create();
        remBarrier = new RemBarrier(cd);

        for (int no = 0; no < 9; no++) {
            gate[no] = Gate.create();
            conductor[no] = new Conductor(no,cd,gate[no],field,alley,remBarrier);
            conductor[no].setName("Conductor-" + no);
            conductor[no].start();
        } 
    }

    public void startCar(int no) {
        gate[no].open();
    }

    public void stopCar(int no) {
        gate[no].close();
    }

    public void barrierOn() {
        remBarrier.on();
    }

    public void barrierOff() {
        remBarrier.off();
    }

   public void barrierSet(int k) {
       remBarrier.set(k);
   }
    
    public void removeCar(int no) {
        if (conductor[no].isAlive())
            conductor[no].interrupt();
    }

    public void restoreCar(int no) {
        if (!conductor[no].isAlive()) {
            conductor[no] = new Conductor(no,cd,gate[no],field,alley,remBarrier);
            conductor[no].setName("Conductor-" + no);
            conductor[no].start();
            remBarrier.restoreCar(no);
        }
    }

    /* Speed settings for testing purposes */

    public void setSpeed(int no, double speed) { 
        conductor[no].setSpeed(speed);
    }

    public void setVariation(int no, int var) { 
        conductor[no].setVariation(var);
    }

}






