part of runner;

class CoinKill extends Coin {

  CoinKill(int id, int pos_x, int pos_y, int size_x, int size_y, [bool isDeadly, bool canCollide, bool isVisible])
      : super(id, pos_x, pos_y, size_x, size_y, 0, isDeadly, canCollide, isVisible) {
    isDeadly = true;
    name = "Coin";
    log("CoinKill ${id} not removed!");
  }

  @override
  bool onCollisionExternal(Model model, Direction d) {
    log("CoinKill collision!");
    model.fail();
    return false;
  }

}