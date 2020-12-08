import processing.video.*;

PImage bg, mainMenu_playButton, mainMenu_snakeLogo;
class MainMenuStage extends Stage {
  @Override
    public void setup() {
    super.setup();
    /*m = new Movie(this,"bg.webm");
     TODO: to extract the video from live wallpaper and to put them onto the background
     m.loop();
     doesnt work! NullPointerException ? 
     
     */
    class MainMenuButton implements Drawable, Updateble {
      float x, y;
      PImage texture;
      public MainMenuButton(float x, float y, PImage texture) {
        this.x = x;
        this.y = y;
        this.texture = texture;
      }
      @Override 
        public int update() {
        return 0;
      }
      @Override
        public void draw() {
        pushStyle();
        imageMode(CENTER);
        image(texture, x, y);
        popStyle();
      }
    }
    MainMenuButton playButton = new MainMenuButton(mainMenu_playButton_x, mainMenu_playButton_y, mainMenu_playButton) {
      @Override
        public int update() {
        if (rectCollidesMouse(x, y, mainMenu_playButton_Size, mainMenu_playButton_Size, CENTER) && mousePressed) {
          changeStage(new GameStage());
        }
        return 0;
      }
    };
    drawables.add(new MyMovie(app,"bg.mov",0,0));
    drawables.add(playButton);
    updatebles.add(playButton);

    drawables.add(new Drawable() {
      @Override
        public void draw() {
        pushStyle();
        imageMode(CENTER);
        image(mainMenu_snakeLogo, mainMenu_snakeLogo_X, mainMenu_snakeLogo_Y);
        popStyle();
      }
    }
    );
  }
  @Override
    public int update() {
    super.update();
    return 0;
  }
  @Override
    public void draw() {
    background(0);
    //image(bg, 0, 0);
    update();
    super.draw();
  }
  @Override
    public void onChange() {
  }
}
