class Ballon {
  int widthBallon;
  int heightBallon;
  int x;
  int y = height;

  Ballon(int widthb, int heightb, int x) {
    widthBallon = widthb;
    heightBallon = heightb;
    this.x = x;
    this.y = height;
  }

  void move() {
    y--;
  }

  void tekenBallon(){
  image(ballon, x, y, widthBallon, heightBallon);
  }

  boolean checkOutOfBounds() {
    if (y < 0) {
      return true;
    } else {
    }
    return false;
  }
}
