import 'package:intl/intl.dart';

class Chat {
  String name;
  String avatarUrl;
  String publicKey;
  String lastMessageText;
  DateTime lastMessageDate;
  int unread;


  getLastMessageDateAsString() {
    return DateFormat.MMMEd().format(lastMessageDate);
  }

  Chat(this.name, this.avatarUrl, this.publicKey, this.lastMessageText,
      this.lastMessageDate, this.unread);
}
