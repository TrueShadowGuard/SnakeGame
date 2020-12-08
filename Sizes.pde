public int mainMenu_playButton_Size;
public int mainMenu_playButton_y;
public int mainMenu_playButton_x;
public int mainMenu_snakeLogoSize;
public int mainMenu_snakeLogo_X;
public int mainMenu_snakeLogo_Y;
public int gameStage_hero_size;
public int mainMenu_bgWidth;
public int mainMenu_bgHeight;
// TODO: TO INIT RES WITHIN STAGE METHOD
void initSizes() {
  mainMenu_playButton_y = height*4/5;
  mainMenu_playButton_x = width/2;
  mainMenu_playButton_Size = width/4;
  mainMenu_snakeLogoSize = width / 2;
  mainMenu_snakeLogo_Y = (int) (height / 2.5);
  mainMenu_snakeLogo_X = width / 2;
  mainMenu_bgWidth = width;
  mainMenu_bgHeight = (int) (0.8 * height);
  gameStage_hero_size = 100;
}
