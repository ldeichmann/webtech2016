part of runner;

class Message extends Block {

  String message;

  Message(int id, int pos_x, int pos_y, int size_x, int size_y, [String message, bool isDeadly, bool canCollide, bool isVisible])
      : super(id, pos_x, pos_y, size_x, size_y, isDeadly, canCollide, isVisible) {
    this.canCollide = canCollide ?? false;
    name = "Message";
    this.message = message ?? "MESSAGE MISSING";
  }

}