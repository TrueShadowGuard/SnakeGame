PImage gameStage_heroTexture;
class GameStage extends Stage { 
  Hero hero;
  @Override
    public void setup() {
    super.setup();
    hero = new Hero();
    updatebles.add(hero);
    drawables.add(hero);
  }
  @Override
    public int update() {
    super.update();
    //println("updated");
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
  @Override
    public void keyPressed() {
    print(key);
    switch(key) {
    case 'w':
    case 'W':    
      hero.up = true;
      break;

    case 's':
    case 'S':
      hero.down = true;
      break;

    case 'a':
    case 'A':
      hero.left = true;
      break;

    case 'd':
    case 'D':
      hero.right = true;
      break;
    }
  }
  @Override
    public void keyReleased() {
    println("released");
    switch(key) {
    case 'w':
    case 'W': 
      if(!hero.inFlight) {
        hero.dy = 100;
      }
      
      break;

    case 's':
    case 'S':
      hero.down = false;
      break;

    case 'a':
    case 'A':
      hero.left = false;
      break;

    case 'd':
    case 'D':
      hero.right = false;
      break;
    }
  }
}

class Hero implements Drawable, Updateble {
  float x, y, dy;

  boolean up;
  boolean down;
  boolean right;
  boolean left;  
  boolean inFlight;
  @Override
    public int update() { 
    if(inFlight) {
      y += dy * deltaTime;
      dy += gameStage_gravity * deltaTime;
      if(y > height) {
        inFlight = false;    
        y = height;
      }
    }
    move();
    return 0;
  }

  @Override
    public void draw() {
    pushStyle();
    imageMode(CENTER);
    image(gameStage_heroTexture, x, y);
    popStyle();
  }
  public void move() {
    // ONE OF THE UP AND DOWN IS TRUE -> TRUE
    if(up) {
      dy = -1000;
      up = false;
      inFlight = true;
    }
    if (left^right) {
      if (right) {
        if (x < width - gameStage_hero_size / 2) {
          x += deltaTime * 1000;
        }
      } else {
        if (x > 0 + gameStage_hero_size / 2) {
          x -= deltaTime * 1000;
        }
      }
    }
  }
}
