part of runner;

class Ground extends Block {

  Ground(int id, int pos_x, int pos_y, int size_x, int size_y, [bool isDeadly, bool canCollide, bool isVisible])
      : super(id, pos_x, pos_y, size_x, size_y, isDeadly, canCollide, isVisible) {
    name = "Ground";
  }

  //returns true if landed, false if not
  @override
  bool onCollisionExternal(Model model, Direction dir) {
    log("${name} ${id} collision with player, coming from ${dir}");
    if (dir == Direction.LEFT || dir == Direction.RIGHT) {
      log("${name} ${id} killed player, coming from ${dir}");
      model.fail(); // kill the player
      return false; //didn't land
    }
    if (dir == Direction.TOP) {
      return true;
    }
    if (dir == Direction.BOTTOM) {
      model.player.hitRoof();
      model.player.pos_y = pos_y - model.player.size_y - 1;
      return false;
    }
    return true; //landed
  }
}