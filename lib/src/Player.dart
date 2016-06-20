part of runner;

class Player extends Rect {

  //fall values
  static const double gravity = 0.8;
  double maxVelocity = 8.0;
  static const int jumpSpeed = 5;

  // distance from left game border
  static const int player_offset = 100;

  double velocity_y;

  //state
  bool jumping;
  bool doubleJump;
  bool grounded;

  bool booster;

  Player() {
    pos_y = 50;
    pos_x = player_offset; // move slightly to the right

    size_x = 20;
    size_y = 50;

    velocity_y = -1.0;

    jumping = true;
    doubleJump = false;
    grounded = false;
    booster = false;
  }

  void jump() {
    if (booster) {
      log("Player: jump() boost");
      velocity_y = jumpSpeed * 2.0;
      grounded = false;
      jumping = true;
      doubleJump = true;
    } else {
      log("Player: jump()");
      if (jumping && !doubleJump) {
        log("Player: jump() Double Jump");
        doubleJump = true;
        velocity_y = jumpSpeed * 2.0;
      }
      if (!jumping && grounded) {
        log("Player: jump() Jumping");
        jumping = true;
        grounded = false;
        velocity_y = jumpSpeed * 2.0;
      }
    }
  }

  void enableBoosting() {
    booster = true;
  }

  void disableBoosting() {
    booster = false;
  }

  void fall() {
    grounded = false;
  }

  void hitRoof() {
    jumping = true;
    doubleJump = true;
    velocity_y = -1.0;
  }

  void update() {
    if (!grounded) {
      pos_y = (pos_y + velocity_y).round();
      velocity_y -= gravity;
      if (velocity_y < -maxVelocity) { // don't accelerate to stupid falling speeds
        velocity_y = -maxVelocity;
      }
    }
    log("Player: update() ${pos_x} ${pos_y}");
  }


  void landed() {
    velocity_y = 0.0;
    grounded = true;
    jumping = false;
    doubleJump = false;
  }

  void reset() {
    pos_y = 50;
    pos_x = 50; // move slightly to the right
    booster = false;
    landed();
  }
}