import 'package:hive/hive.dart';
import 'package:secure_chat/domain/message.dart';

class SentMessageRepository {
  Future<List<Message>> getSentMessages(String key) async {
    var box = await Hive.openBox<Message>('sent_messages');
    return List.of(box.values.where((element) => element.to == key));
  }

  Future<void> addSentMessage(Message message) async {
    var box = await Hive.openBox<Message>('sent_messages');
    box.add(message);
  }
}
