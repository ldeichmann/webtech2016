part of runner;

class Spawn extends Block {

  Spawn(int id, int pos_x, int pos_y, int size_x, int size_y) : super(id, pos_x, pos_y, size_x, size_y) {
    name = "Spawn";
    canCollide = false;
    isDeadly = false;
    isVisible = false;
  }

}