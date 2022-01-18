public virtual class Marker {
    public virtual void write() {
        System.debug('Writing some text.');
    }

    public virtual  Double discount() {
   Discount1();
        System.debug('Discuount');
        return .05;
    }
    
    public Static void Discount1(){
          System.debug('Discuount1');
    }
}