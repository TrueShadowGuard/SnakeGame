public boolean rectCollidesMouse(float x, float y, float w, float h,int RECT_TYPE_ID /* CORNERS / CENTER... */) { 
  switch(RECT_TYPE_ID) {
    case CORNER: return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
    case CENTER: return mouseX> x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY< y + h/2;
    default: System.err.println("AN UNNKNOWN RECT TYPE ID");
  }
  return false;
}
