part of runner;

class SpeedBlock extends Block {

  int speedIncrease;
  bool collected;

  SpeedBlock(int id, int pos_x, int pos_y, int size_x, int size_y, int speed) : super(id, pos_x, pos_y, size_x, size_y) {
    canCollide = true;
    isDeadly = false;
    name = "SpeedBlock";
    this.speedIncrease = speed;
    isVisible = true;
  }

  //returns true if landed, false if not
  @override
  bool onCollision(Model m, Player p, Direction d) {
    if (!collected) {
      collected = true;
      m.speed += speedIncrease;
    }
    return false;
  }
}