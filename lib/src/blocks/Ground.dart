part of runner;

class Ground extends Block {

  Ground(int id, int pos_x, int pos_y, int size_x, int size_y) : super(id, pos_x, pos_y, size_x, size_y) {
    canCollide = true;
    isDeadly = false;
    name = "Ground";
  }

  //returns true if landed, false if not
  @override
  bool onCollision(Model m, Player p, Direction d) {
    log("${name} ${id} collision with player, coming from ${d}");
    if (d == Direction.LEFT || d == Direction.RIGHT) {
      log("${name} ${id} killed player, coming from ${d}");
      m.fail();
      return false; //didn't land
    }
    if (d == Direction.TOP) {
      return true;
    }
    if (d == Direction.BOTTOM) {
      p.hitRoof();
      p.pos_y = pos_y - p.size_y - 1;
      return false;
    }
    return true; //landed
  }
}