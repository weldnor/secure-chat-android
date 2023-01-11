import '../domain/chat.dart';

abstract class AbstractChatService {
  List<Chat> getChats();
}

class ChatService implements AbstractChatService {
  @override
  List<Chat> getChats() {
    return [
      Chat(
          'Anthony',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU',
          'key1',
          'What do you think?',
          DateTime.now(),
          2),
      Chat(
          'Anthony',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU',
          'key1',
          'What do you think?',
          DateTime.now(),
          2),
      Chat(
          'Anthony',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU',
          'key1',
          'What do you think?',
          DateTime.now(),
          2)
    ];
  }
}
