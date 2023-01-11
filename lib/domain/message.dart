class Message {
  String from;
  String to;
  String text;

  Message(this.from, this.to, this.text);

  @override
  String toString() {
    return 'Message{from: $from, to: $to, text: $text}';
  }
}
