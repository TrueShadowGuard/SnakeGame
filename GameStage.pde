class GameStage extends Stage {
  @Override
  public void setup() {
    super.setup();
    class Circle implements Drawable, Updateble {
      float x, y;
      public void draw() {
        fill(255);
        circle(x,y,100);
      }
      public int update() {
        x = mouseX;
        y = mouseY;
        return 0;
      }
    }
    Circle c = new Circle();
    drawables.add(c);
    updatebles.add(c);   
  }
  @Override
  public int update() {
    super.update();
    return 0;
  }
  @Override
  public void draw() {
    background(0);
    update();
    super.draw();
  }
  @Override
  public void onChange() {
    
  }
}
