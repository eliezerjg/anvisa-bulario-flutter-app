class Message {
  String title;
  String message;
  bool isFav;

  Message(this.title, this.message, this.isFav);

  Message copyWith({String? title, String? message, bool? isFav}) {
    return Message(
        title ?? this.title, message ?? this.message, isFav ?? this.isFav);
  }
}