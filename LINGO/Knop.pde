class Knop {
  String tekst;
  int hoogte,breedte, x, y;

  Knop(String tekst, int breedte, int hoogte, int x, int y) {
    this.tekst = tekst;
    this.breedte = breedte;
    this.hoogte = hoogte;
    this.x = x;
    this.y = y;
  }

  boolean isGeklikt() {
    if (mouseX > x && mouseX < x + breedte && mouseY > y && mouseY < y + hoogte) {
      return true;
    } 
    return false;
  }

  void tekenKnop() {
    fill(255);
    rect(x, y, breedte,hoogte);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize((breedte + hoogte) / 9);
    text(tekst, x + breedte / 2, y + hoogte / 2 );
  }
}
