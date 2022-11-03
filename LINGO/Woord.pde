class Woord {
  char woord[];
  int woordlength;
  Woord() {
    this.woord = new char[1];
    this.woordlength = 0;
  }

  void voegLetterToe() {
    if ( key == BACKSPACE && woordlength > 0) {
    woord = shorten(woord);
    woordlength --;
    }else if(key != ENTER && key != CODED && woordlength < 23 && key != BACKSPACE){
      woord = expand(woord, woordlength + 1);
      woord[woordlength] = key;
      woordlength ++;
    }
  }

  void teken() {
    if (woordlength != 0) {
      String tekst = "";
      for (int i = 0; i < woord.length; i ++) { 
        tekst += woord[i];
      }
      textSize((width + height) / 120 + ((width + height) / ((woord.length + 1) * 1.5) / 2 )); 
      fill(255);
      text(tekst, width / 2, height / 2);
    }
  }
   void tekenEncrypted() {
    if (woordlength != 0) {
      String tekst = "";
      for (int i = 0; i < woord.length; i ++) { 
        tekst += "*";
      }
      textSize((width + height) / 120 + ((width + height) / ((woord.length + 1) * 1.5) / 2 )); 
      fill(255);
      text(tekst, width / 2, height / 2);
    }
  }
  
}
