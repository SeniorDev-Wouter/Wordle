import processing.sound.*;

class SpeelScherm {
  Woord[] woorden;
  int[][] kubus;
  final int FOUT = 1;
  final int CORRECT = 2;
  final int VERKEERDEPLEK = 3;
  int woord;
  PApplet papplet;

  SpeelScherm(PApplet papplet) {
    woord = 0;
    woorden = new Woord[startScherm.woord.woordlength];
    this.papplet = papplet;
    kubus = new int[startScherm.woord.woordlength][startScherm.woord.woordlength];
    println(startScherm.woord.woordlength);
    for (int i = 0; i < startScherm.woord.woordlength; i++) {
      woorden[i] = new Woord();
      for (int j = 0; j < startScherm.woord.woordlength; j++) {
        kubus[i][j] = FOUT;
      }
    }
  }

  void tekenSpeelveld() {
    for (int i = 0; i < startScherm.woord.woordlength; i++) {
      for (int j = 0; j < startScherm.woord.woordlength; j++) {
        switch (kubus[j][i]) {
        case FOUT:
          fill(255);
          break;

        case CORRECT:
          fill(#14FF00);
          break;

        case VERKEERDEPLEK:
          fill(#FFAC27);
          break;
        }
        rect(width / startScherm.woord.woordlength * i, height / startScherm.woord.woordlength * j, width / startScherm.woord.woordlength, height / startScherm.woord.woordlength);
      }
    }
  }

  void tekenWoorden() {
    for (int i = 0; i < woord; i++) {
      for (int j = 0; j < woorden[0].woordlength; j++) {
        fill(#F50C0C);
        textSize( width / startScherm.woord.woordlength / 2);
        textAlign(CENTER, CENTER);
        text(str(woorden[i].woord[j]), width / startScherm.woord.woordlength * j + width / startScherm.woord.woordlength / 2, height / startScherm.woord.woordlength * i + height / startScherm.woord.woordlength / 3);
      }
    }

    for (int i = 0; i < woord + 1; i++) {
      for (int j = 0; j < woorden[woord].woordlength; j++) {
        fill(#F50C0C);
        textSize( width / startScherm.woord.woordlength / 2);
        textAlign(CENTER, CENTER);
        text(str(woorden[i].woord[j]), width / startScherm.woord.woordlength * j + width / startScherm.woord.woordlength / 2, height / startScherm.woord.woordlength * i + height / startScherm.woord.woordlength / 3);
      }
    }
  }

  boolean getCorrect() {
    int correct = 0;
    for (int i = 0; i <  startScherm.woord.woordlength; i++) {
      if (woorden[woord].woord[i] == startScherm.woord.woord[i]) {
        correct ++;
      }
    }
    if (correct == startScherm.woord.woordlength) {
      return true;
    }
    printArray(woorden[woord].woord);
    printArray(startScherm.woord.woord);
    return false;
  }

  void typen() {
    if (key == ENTER && woorden[woord].woordlength == startScherm.woord.woordlength && woord <= startScherm.woord.woordlength - 1) {
      if (getCorrect()) {
        eindScherm = new EindScherm(papplet);
        state = EIND;
        correct.play();
        applaus.play();
        woordGeraden = true;
      } else if (key == ENTER && woord == startScherm.woord.woordlength - 1) {
        eindScherm = new EindScherm(papplet);
        state = EIND;
        fout.play();
      }
      vergelijkWoord();
      woord ++;
    } else if (woorden[woord].woordlength < startScherm.woord.woordlength || key == BACKSPACE) {
      woorden[woord].voegLetterToe();
    }
  }

  void vergelijkWoord() {
    for (int i = 0; i < woorden[woord].woordlength; i++) {
      if (woorden[woord].woord[i] == startScherm.woord.woord[i]) {
        kubus[woord][i] = CORRECT;
      } else { 
        int aantalGekleurd = 0;
        int aantalInWoord = 0;      
        int aantalCorrectInWoord = 0;
        int aantalCorrect = 0;
        for (int j = 0; j < woorden[woord].woordlength; j++) {
          if (woorden[woord].woord[i] == startScherm.woord.woord[j]) {
            aantalCorrectInWoord ++;
          }
        }
        println(aantalCorrectInWoord);
        for (int j = 0; j < woorden[woord].woordlength; j++) {
          if (woorden[woord].woord[i] == startScherm.woord.woord[j] && woorden[woord].woord[j] == startScherm.woord.woord[j]) {
            aantalCorrect += 1;
          }
        }
        aantalGekleurd += aantalCorrect;
        for (int j = 0; j < woorden[woord].woordlength; j++) {
          if (woorden[woord].woord[i] == startScherm.woord.woord[j]) {
            aantalInWoord ++;
          }
        }
        for (int j = 0; j < woorden[woord].woordlength; j++) {
          if ((kubus[woord][j] == VERKEERDEPLEK) && woorden[woord].woord[i] == woorden[woord].woord[j]) {
            aantalGekleurd ++;
          }
        }
        println(aantalGekleurd);
        for (int j = 0; j < woorden[woord].woordlength; j++) {
          if (woorden[woord].woord[i] == startScherm.woord.woord[j] && aantalGekleurd < aantalInWoord) {
            kubus[woord][i] = VERKEERDEPLEK;
          }
        }
      }
    }
  }
}
