part of runner;

class SpikesBottom extends Block {

  SpikesBottom(int id, int pos_x, int pos_y, int size_x, int size_y, [bool isDeadly, bool canCollide, bool isVisible])
      : super(id, pos_x, pos_y, size_x, size_y, isDeadly, canCollide, isVisible) {
    name = "SpikesBottom";
  }

  //kills from bottom, not from top
  @override
  bool onCollisionExternal(Model model, Direction dir) {
    log("${name} ${id} collision with player, coming from ${dir}");
    if (dir == Direction.LEFT || dir == Direction.RIGHT || dir == Direction.BOTTOM) {
      log("${name} ${id} killed player, coming from ${dir}");
      model.fail();
      return false; //didn't land
    }
    else {
      return true;
    }
    return true; //landed
  }
}