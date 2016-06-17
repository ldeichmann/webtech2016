part of runner;

class Booster extends Triggerable {

  bool boost;
  bool collected;

  Booster(int id, int pos_x, int pos_y, int size_x, int size_y, bool boost, [bool isDeadly, bool canCollide, bool isVisible])
      : super(id, pos_x, pos_y, size_x, size_y, isDeadly, canCollide, isVisible) {
    name = "Booster";
    this.boost = boost;
    this.isVisible = isVisible ?? false;
    collected = false;
    print(this.boost);
  }

  @override
  void start(Model model) {
    if (!collected) {
      collected = true;
      boost == true ? model.player.enableBoosting() : model.player.disableBoosting();
    }
  }
}