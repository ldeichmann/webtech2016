part of runner;

class SpeedBlock extends Triggerable {

  int speedIncrease;
  bool collected;

  SpeedBlock(int id, int pos_x, int pos_y, int size_x, int size_y, [int speed, bool isDeadly, bool canCollide, bool isVisible])
      : super(id, pos_x, pos_y, size_x, size_y, isDeadly, canCollide, isVisible) {
    name = "SpeedBlock";
    this.isVisible = isVisible ?? false;
    this.speedIncrease = speed ?? 0;
    collected = false;
  }

  @override
  void start(Model model) {
    if (!collected) {
      collected = true;
      model.speed += speedIncrease;
    }
  }
}