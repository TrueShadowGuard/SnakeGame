int mainMenu_playButton_Size;
int mainMenu_playButton_y;
int mainMenu_playButton_x;
int mainMenu_snakeLogoSize;
int mainMenu_snakeLogo_X;
int mainMenu_snakeLogo_Y;
int mainMenu_bgWidth;
int mainMenu_bgHeight;
int gameStage_hero_size;
int gameStage_gravity; // [ PX/SEC/SEC ]

// TODO: TO INIT RES WITHIN STAGE METHOD
void initSizes() {
  a = width;
  b = height;
  mainMenu_playButton_y = height*3/4;
  mainMenu_playButton_x = width/2;
  mainMenu_playButton_Size = width/4;
  mainMenu_snakeLogoSize = width / 2;
  mainMenu_snakeLogo_Y = (int) (height / 4);
  mainMenu_snakeLogo_X = width / 2;
  mainMenu_bgWidth = width;
  mainMenu_bgHeight = (int) (0.8 * height);
  gameStage_gravity = 5000;
  gameStage_hero_size = 100;
}
