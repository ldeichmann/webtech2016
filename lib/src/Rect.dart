part of runner;

class Rect {
  //pos size vel
  int pos_y;
  int pos_x;

  int size_x;
  int size_y;

  double centerX() {
    return (pos_x + (size_x/2));
  }

  double centerY() {
    return (pos_y + (size_y/2));
  }

  /// Detects collisions between rectangles
  bool intersects(Rect rect) {
    return ((pos_x <= rect.pos_x + rect.size_x) &&
        (pos_x + size_x) >= rect.pos_x &&
        pos_y <= (rect.pos_y + rect.size_y) &&
        (size_y + pos_y) >= rect.pos_y);
  }
}