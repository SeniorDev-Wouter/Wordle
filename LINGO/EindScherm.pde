
class EindScherm {
  Knop retry;
  PApplet papplet;
  Knop[] knoppen;
 ArrayList<Ballon> ballonnen;
  EindScherm(PApplet papplet) {
    this.retry = new Knop("Play again", width / 10, height / 10, width / 2 - width / 10, height - height / 8);
    this.knoppen = new Knop[1];
    ballonnen = new ArrayList<Ballon>();
    this.papplet = papplet;
    knoppen[0] = retry;
  }

  void teken() {
    for (int i = 0; i < knoppen.length; i ++) {
      knoppen[i].tekenKnop();
    }
    if(woordGeraden){
    for(int i =0; i < ballonnen.size(); i++){
    ballonnen.get(i).tekenBallon();
    }
    }
    startScherm.woord.teken();
  }
  
  void ballon(){
  if(int(random(100)) == 3){
  ballonnen.add(new Ballon(30 + int(random(10)), 40 + int(random(40)), int(random(width))));
  printArray(ballonnen);
    }
  for(int i =0; i < ballonnen.size(); i++){
  if(ballonnen.get(i).checkOutOfBounds()){
  ballonnen.remove(i);
  println(1);
  }
  ballonnen.get(i).move();
  }
  }
  

  void interactie() {
    try {
      if (checkGeklikt() < knoppen.length) {
        gebruikKnop(checkGeklikt());
      }
    }
    catch(Exception EX) {
      println(EX);
    };
  }

  int checkGeklikt() throws Exception {
    for (int i = 0; i < knoppen.length; i++)
      if (knoppen[i].isGeklikt()) {
        return i;
      }
    throw new Exception("KLIK OP DE KNOP");
  }

  void gebruikKnop(int index) {
    switch(index) {
    case 0:
      state = START;
  startScherm = new StartScherm(papplet);
  woordGeraden = false;
      break;
    }
  }
}
