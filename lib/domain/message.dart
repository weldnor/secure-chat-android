import 'package:hive/hive.dart';

part 'message.g.dart';

@HiveType(typeId: 2)
class Message {
  @HiveField(0)
  String from;
  @HiveField(1)
  String to;
  @HiveField(2)
  String text;
  @HiveField(3)
  int timestamp;

  Message(this.from, this.to, this.text, this.timestamp);

  @override
  String toString() {
    return 'Message{from: $from, to: $to, text: $text, date: $timestamp}';
  }
}
