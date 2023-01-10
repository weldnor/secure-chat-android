import 'package:intl/intl.dart';

class Chat {
  String avatarUrl;
  String name;
  String lastMessageText;
  DateTime lastMessageDate;
  int unread;

  getLastMessageDateAsString(){
    return DateFormat.MMMEd().format(lastMessageDate);
  }

  Chat(this.avatarUrl, this.name, this.lastMessageText, this.lastMessageDate,
      this.unread);
}

abstract class AbstractChatService {
  List<Chat> getChats();
}

class ChatService implements AbstractChatService {
  @override
  List<Chat> getChats() {
    return [
      Chat(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU',
          'Anthony',
          'What do you think?',
          DateTime.now(),
          2),
      Chat(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU',
          'Brain',
          'What do you think?',
          DateTime.now(),
          2),
      Chat(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU',
          'Chrone',
          'What do you think?',
          DateTime.now(),
          2),
      Chat(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU',
          'Dart',
          'What do you think?',
          DateTime.now(),
          2),
      Chat(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU',
          'Tolo',
          'What do you think?',
          DateTime.now(),
          2),
    ];
  }
}
