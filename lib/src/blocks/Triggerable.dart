part of runner;

class Triggerable extends Block {

  Triggerable(int id, int pos_x, int pos_y, int size_x, int size_y, [bool isDeadly, bool canCollide, bool isVisible])
      : super(id, pos_x, pos_y, size_x, size_y, isDeadly, canCollide, isVisible) {
    name = "Trigger";
  }

  void start(Model model) {
    log("Triggerable ${id} not set!");
  }

}