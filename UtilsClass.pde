public boolean rectCollidesMouse(float x, float y, float w, float h,int RECT_TYPE_ID /* CORNERS / CENTER... */) { 
  switch(RECT_TYPE_ID) {
    case CORNER: return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
    case CENTER: return mouseX> x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY< y + h/2;
    default: System.err.println("AN UNNKNOWN RECT TYPE ID");
  }
  return false;
}

class MyMovie extends Movie implements Drawable {
  int x, y, w, h;
  public MyMovie(PApplet a, String s, int x, int y) {
    super(a, s);
    this.loop();
    this.x = x;
    this.y = y;
    print("w = " + w + "h = " + h);
  }
  @Override
    public void draw() {   
      //print(mainMenu_bgWidth + " ");
      //println(mainMenu_bgHeight);
      // Works only with 0, 0 ??? 
      image(this, 0, 0);      
  }
}
