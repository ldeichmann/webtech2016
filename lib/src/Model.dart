part of runner;

enum Direction {
  TOP,
  BOTTOM,
  LEFT,
  RIGHT
}

class Model {

  View v;
  Player p;

  Map<String, String> levels;
  Level currentLevel;
  String currentLevelName;
  bool running;
  bool won;
  bool inMenu;

  int visibleIndex;
  int playerPosX;
  int score;
  int points;

  List<Block> visibleBlocks;

  int viewport_x;
  int viewport_y;
  int speed;

  Model(int viewport_x, int viewport_y, int speed) {
    this.visibleBlocks = new List();
    this.levels = new Map<String, String>();

    this.viewport_x = viewport_x;
    this.viewport_y = viewport_y;

    this.speed = speed;

    this.won = false;
    this.inMenu = true;
    this.running = false;


    this.p = new Player();
  }

  void update(Timer t) {

    if (!this.running) {
      return;
    }

    getVisibleBlocks();

    this.p.update();
    this.visibleBlocks.forEach((b) => b.onUpdate());
    this.playerPosX += speed;

    detectCollisions();

    if (this.p.getPosY() < 0) {
      this.fail();
    }
    this.score = (this.playerPosX/5).toInt() + this.points;

    print("Tick");

  }

  void fail() {
    this.running = false;
    this.won = false;
  }

  void finish() {
    this.running = false;
    this.won = true;
  }

  void start() {
    this.p.reset();
    this.visibleIndex = 0;
    this.playerPosX = currentLevel.spawn.pos_x;
    this.p.pos_x = currentLevel.spawn.pos_x;
    this.p.pos_y = currentLevel.spawn.pos_y;
    this.visibleBlocks.clear();
    this.points = 0;
    this.running = true;
    this.inMenu = false;
  }

  void detectCollisions() {
    try {
      bool onGround = false;
      for (Block b in this.visibleBlocks) {
        if (b.canCollide) {
          if (simpleCollision(this.p, b)) {
            Direction dir = collisionDirection(this.p, b);
            if (b.onCollision(this, this.p, dir)) {
              this.p.landed();
              this.p.pos_y = b.pos_y + b.size_y;
              onGround = true;
//              break;
            }
          }
        }
      }
      if (!onGround) {
        this.p.fall();
      }

    } catch(e, ex) {
      print(e);
      print(ex);
    }

  }

  void jump() {
    p.jump();
  }

  //detect simple collisions between rectangles
  //source: https://developer.mozilla.org/en-US/docs/Games/Techniques/2D_collision_detection
  bool simpleCollision(player, rect) {
    if ((player.pos_x + this.playerPosX) <= (rect.pos_x + rect.size_x) &&
        ((player.pos_x + this.playerPosX) + player.size_x) >= rect.pos_x &&
        player.pos_y <= (rect.pos_y + rect.size_y) &&
        (player.size_y + player.pos_y) >= rect.pos_y) {
      return true;
    } else {
      return false;
    }
  }

  //https://gamedev.stackexchange.com/questions/29786/a-simple-2d-rectangle-collision-algorithm-that-also-determines-which-sides-that
  Direction collisionDirection(player, rect) {
    double w = 0.5 * (player.size_x + rect.size_x);
    double h = 0.5 * (player.size_y + rect.size_y);
    double dx = (player.centerX() + playerPosX) - rect.centerX();
    double dy = player.centerY() - rect.centerY();

    if (dx.abs() <= w && dy.abs() <= h) {
      /* collision! */
      double wy = w * dy;
      double hx = h * dx;

      if (wy > hx) {
        if (wy > -hx) {
          return Direction.TOP;
        } else {
          return Direction.LEFT;
        }
      } else {
        if (wy > -hx) {
          return Direction.RIGHT;
        } else {
          return Direction.BOTTOM;
        }
      }
    }
  }

  bool isBlockVisible(Block b) {
    if ((b.pos_x + b.size_x) > (playerPosX) && (b.pos_x) < (playerPosX + viewport_x)) {
      return true;
    }
  }

  void getVisibleBlocks() {
    visibleBlocks.clear();

    //get all visible blocks, break when we reach invisible blocks
    for (Block b in currentLevel.blockList) {
      if (isBlockVisible(b)) {
        visibleBlocks.add(b);
      }
    }
  }

  void setLevel(String level) {
    currentLevel = new Level(level);
  }

  void setLevelList(String jsonString) {
    this.levels.clear();

    try {
      var jsonData = JSON.decode(jsonString);
      for (Map m in jsonData) {
        this.levels[m["name"]] = m["filename"];
      }
    } catch(e) {
      print(e);
    }

  }

  void mainMenu() {

    this.inMenu = true;

  }

}