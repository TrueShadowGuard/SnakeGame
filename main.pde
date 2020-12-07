
Stage currentStage;
abstract class Stage implements Drawable, Updateble, Setupable { 
  ArrayList<Drawable> drawables;
  ArrayList<Updateble> updatebles;
  ArrayList<Setupable> s;
  public void draw() {
    for (Drawable dr : drawables) {
      dr.draw();
    }
  }
  public void setup() {
    s = new ArrayList<Setupable>();
    updatebles = new ArrayList<Updateble>();
    drawables = new ArrayList<Drawable>();
  }
  public int update() {
    for (Updateble up : updatebles) {
      if (up.update()==1) {
        updatebles.remove(up);
      }
    }
    return 0;
  }
  
  abstract public void onChange();
}
interface Drawable {
  public void draw();
}
/* Returns the exit code:
 0 - All is ok!
 1 - Delete this
 */
interface Updateble {
  public int update();
}
interface Setupable {
  public void setup();
}

public void changeStage(Stage stage) {
    if (currentStage!=null) {
      currentStage.onChange();
    }
    currentStage = stage;
    currentStage.setup();
}
void setup() {
  loadRes();
  changeStage(new MainMenuStage());
}
void update() {
  currentStage.update();
}
void draw() {
  currentStage.draw();
}
void settings() {
  size(480,640);
}
void loadRes() {
  initSizes();
  bg = loadImage("bg.jpg");
  bg.resize(width,height);
  mainMenu_playButton = loadImage("MainMenu_playButton.png");
  mainMenu_playButton.resize(mainMenu_playButton_Size,mainMenu_playButton_Size);
  mainMenu_snakeLogo = loadImage("SnakeLogo.png");
  mainMenu_snakeLogo.resize(mainMenu_snakeLogoSize,mainMenu_snakeLogo.height / mainMenu_snakeLogo.width * mainMenu_snakeLogoSize);
}
