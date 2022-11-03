
class StartScherm {
  Knop start;
  Woord woord;
  Knop randomNL;
  Knop randomENG;
  boolean encryptedTrue;
  Knop encrypted;
  Knop[] knoppen;
  int woordLength;
  PApplet papplet;

  StartScherm(PApplet papplet) {
    this.start = new Knop("Start", width / 10, height / 10, width / 4 - width / 5, height - height / 8);
    this.randomNL = new Knop("Random: NL", width / 10, height / 10, width - width / 4 - width / 5, height - height / 8);
    this.randomENG = new Knop("Random: EN", width / 10, height / 10, width - width / 5, height - height / 8);
    this.encrypted = new Knop("View Word", width / 10, height / 10, width / 2 - width / 5, height - height / 8);
    this.woord = new Woord();
    this.papplet = papplet;
    this.knoppen = new Knop[4];
    this.woordLength = 0;
    this.encryptedTrue = true;
    knoppen[0] = start;
    knoppen[1] = randomNL;
    knoppen[3] = randomENG;
    knoppen[2] = encrypted;
  }

  void tekenStartScherm() {
    for (int i = 0; i < knoppen.length; i ++) {
      knoppen[i].tekenKnop();
    }
    if (encryptedTrue) {
      woord.tekenEncrypted();
    } else {
      woord.teken();
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
      if (woord.woordlength > 0) {
        state = SPEL;
        speelScherm = new SpeelScherm(papplet);
      }
      break;
    case 1:
      if (woord.woordlength == 0) {
        woord.woord = expand(woord.woord, woord.woordlength + 1);
        woord.woordlength++;
      }
      int randomNL = int(random(woordenlijstNL.length - 1));
         char[] placeholder = new char[woordenlijstNL[randomNL].length()];
      for (int i = 0; i < woordenlijstNL[randomNL].length(); i++) {
        placeholder[i] = woordenlijstNL[randomNL].charAt(i);
      }
      woord.woord = placeholder;
      woord.woordlength = woord.woord.length;
      break;
    case 2:
      if (encryptedTrue) {
        encryptedTrue = false;
      } else {
        encryptedTrue = true;
      }
      break;
      //case 3:
      //  if (woord.woordlength == 0) {
      //    woord.woord = expand(woord.woord, woord.woordlength + 1);
      //    woord.woordlength++;
      //  }
      //  int randomENG = int(random(woordenBankENG.length - 1));
      //  woord.woord = woordenBankENG[randomENG];
      //  woord.woordlength = woordenBankENG[randomENG].length;
      //  state = SPEL;
      //  speelScherm = new SpeelScherm();
      //  break;
    }
  }
}
