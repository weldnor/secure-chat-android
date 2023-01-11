import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:secure_chat/service/contact_service.dart';
import 'package:secure_chat/service/settings_service.dart';

import '../domain/chat.dart';
import '../domain/contact.dart';
import 'message_service.dart';

abstract class IChatService {
  Future<List<Chat>> getChats();
}

class ChatService implements IChatService {
  final SettingsService _settingsService = GetIt.I.get<SettingsService>();
  final ContactService _contactService = GetIt.I.get<ContactService>();
  final IMessageService _messageService = GetIt.I.get<IMessageService>();

  @override
  Future<List<Chat>> getChats() async {
    var settings = await _settingsService.getSettings();

    var url = Uri.http('10.0.2.2:8080', 'chats', {'key': settings!.publicKey});

    var response = await http.get(url);
    var jsonArray = const JsonDecoder().convert(response.body);

    List<Chat> chats = [];

    for (int i = 0; i < jsonArray.length; i++) {
      var jsonObj = jsonArray[i];

      String key = jsonObj['key'];
      String lastMessageText = jsonObj['lastMessageText'];
      String lastMessageKey = jsonObj['lastMessageKey'];
      int lastMessageTimestamp = jsonObj['lastMessageTimestamp'];
      int unread = jsonObj['unread'];

      if (!await _contactService.contactExistsWithKey(key)) {
        continue;
      }

      Contact contact = await _contactService.getContact(key);

      if (lastMessageKey == settings.publicKey) {
        var lastMessage = (await _messageService.getSentMessages(key)).last;

        chats.add(Chat(settings.name, settings.avatarUrl, key, lastMessage.text,
            lastMessageTimestamp, unread));
        continue;
      }
      // else

      chats.add(Chat(contact.name, contact.avatarUrl, key, await _messageService.decryptMessage(lastMessageText),
          lastMessageTimestamp, unread));
    }
    // fixme
    return chats;
  }
}
