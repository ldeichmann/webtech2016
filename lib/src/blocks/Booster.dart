part of runner;

class Booster extends Block {

  bool boost;

  Booster(int id, int pos_x, int pos_y, int size_x, int size_y, bool b) : super(id, pos_x, pos_y, size_x, size_y) {
    this.canCollide = true;
    this.isDeadly = false;
    this.name = "Trigger";
    this.boost = b;
  }

  @override
  bool onCollision(Model m, Player p, Direction d) {
    this.boost == true ? m.player.enableBoosting() : m.player.disableBoosting();
    return false;
  }
}