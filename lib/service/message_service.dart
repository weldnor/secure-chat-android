import 'package:secure_chat/domain/message.dart';

abstract class AbstractMessageService {
  List<Message> getMessages();
}

class MessageService implements AbstractMessageService {
  @override
  List<Message> getMessages() {
    return [Message('hello dart!'), Message('hello world!')];
  }
}
