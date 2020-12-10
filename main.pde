Stage currentStage;
PApplet app;
abstract class Stage implements Drawable, Updateble, Setupable { 
  ArrayList<Drawable> drawables;
  ArrayList<Updateble> updatebles;
  ArrayList<Setupable> setupables;
  public void draw() {
    for (Drawable dr : drawables) {
      dr.draw();
    }
  }
  public void setup() {
    setupables = new ArrayList<Setupable>();
    updatebles = new ArrayList<Updateble>();
    drawables = new ArrayList<Drawable>();
    for (Setupable sb : setupables) {
      sb.setup();
    }
  }
  public int update() {
    int tmp = millis();
    deltaTime = (tmp - time) / 1000f;
    time = tmp;
    for (Updateble up : updatebles) {
      if (up.update()==1) {
        updatebles.remove(up);
      }
    }
    return 0;
  }
  public void keyPressed() {
  }
  public void keyReleased() {
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
  app = this;
  loadRes();
  changeStage(new MainMenuStage());
}

int time;
float deltaTime;

void draw() {
  currentStage.draw();
}
void settings() {
  size(1280, 720);
}
void loadRes() {
  initSizes(); 
  mainMenu_playButton = loadImage("MainMenu_playButton.png");
  mainMenu_playButton.resize(mainMenu_playButton_Size, mainMenu_playButton_Size);
  mainMenu_snakeLogo = loadImage("SnakeLogo.png");
  mainMenu_snakeLogo.resize(mainMenu_snakeLogoSize, mainMenu_snakeLogo.height / mainMenu_snakeLogo.width * mainMenu_snakeLogoSize);
  gameStage_heroTexture = loadImage("batmanIcon.png");
  gameStage_heroTexture.resize(gameStage_hero_size, gameStage_hero_size);
}
void keyPressed() {
  currentStage.keyPressed();
}
void keyReleased() {
  currentStage.keyReleased();
}
void movieEvent(Movie m) {
  m.read();
}
