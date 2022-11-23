final int START = 1;
final int SPEL = 2;
final int EIND = 3;
int state = 1;
boolean woordGeraden = false;
String[] woordenlijstNL;
boolean newwoord = true;
StartScherm startScherm;
SpeelScherm speelScherm;
EindScherm eindScherm;
SoundFile correct; 
SoundFile applaus; 
SoundFile fout; 
PImage ballon;
Ballon balling = new Ballon(50,200,20);

void setup() {
  size(1600, 900);
  
  surface.setResizable(true);
  frameRate(1000);
  startScherm = new StartScherm(this);
  woordenlijstNL = loadStrings("woordenlijstNL.txt");
  ballon = loadImage("images/balloon.png");
  correct = new SoundFile(this, "sounds/applause-01.mp3");
  applaus = new SoundFile(this, "sounds/applause-02.mp3");
  fout = new SoundFile(this, "sounds/spongebob-boowomp.mp3");
}

void draw() {
  background(0);
  switch(state) {
  case START:
    startScherm.tekenStartScherm();
    break;

  case SPEL:
    speelScherm.tekenSpeelveld();
    speelScherm.tekenWoorden();
    break;

  case EIND: 
    eindScherm.teken();
    eindScherm.ballon();
    break;
  }
}

void keyPressed() {
  switch(state) {
  case START:
    startScherm.woord.voegLetterToe();
    break;

  case SPEL:
    speelScherm.typen();
    break;

  case EIND:
    break;
  }
}

void mousePressed() {
  switch(state) {
  case START:
    startScherm.interactie();
    break;

  case SPEL:
    break;

  case EIND:
    eindScherm.interactie();
    break;
  }
}
