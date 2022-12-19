package scope;

import java.io.Serializable;

public class Scope implements Serializable{
    public Scope(){}
    private int number=0;
    public int getNmuber() {
        number++;
        return number;
    }
        public void setNumber(int newNumber){
            this.number=newNumber;
        }
}
