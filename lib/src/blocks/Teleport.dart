part of runner;

class Teleport extends Block {

  Spawn spawn;

  Teleport(int id, int pos_x, int pos_y, int size_x, int size_y, Spawn s) : super(id, pos_x, pos_y, size_x, size_y) {
    this.canCollide = true;
    this.isDeadly = false;
    this.name = "Teleport block-border";
    this.nameLow = "Teleport-low block-border-low";
    this.spawn = s;
  }

  //returns true if landed, false if not
  @override
  bool onCollision(Model m, Player p, Direction d) {
    p.reset();
    m.resetVisibleIndex();
    m.player.pos_x = this.spawn.pos_x + m.player.pos_x;
    p.pos_y = this.spawn.pos_y;
    return false;
  }
}