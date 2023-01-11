import 'package:intl/intl.dart';

class Chat {
  String name;
  String avatarUrl;
  String publicKey;
  String lastMessageText;
  int lastMessageTimestamp;
  int unread;

  getLastMessageDateAsString() {
    return DateFormat.MMMEd()
        .format(DateTime.fromMillisecondsSinceEpoch(lastMessageTimestamp));
  }

  Chat(this.name, this.avatarUrl, this.publicKey, this.lastMessageText,
      this.lastMessageTimestamp, this.unread);
}
