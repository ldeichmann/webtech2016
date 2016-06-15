part of runner;

class Bullet extends Block {

  Bullet(int id, int pos_x, int pos_y, int size_x, int size_y) : super(id, pos_x, pos_y, size_x, size_y) {
    canCollide = true;
    isDeadly = true;
    name = "Bullet";
  }

  void start() {
    speed_x = -2;
  }

}