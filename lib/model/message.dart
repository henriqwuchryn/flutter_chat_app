class Message {
  final String body;
  final DateTime createdAt;
  bool edited = false;
  final String authorId;
  final String roomId;

  Message(this.authorId, this.body, this.createdAt, this.roomId);
}
