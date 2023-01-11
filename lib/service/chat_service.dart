import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:secure_chat/service/contact_service.dart';
import 'package:secure_chat/service/settings_service.dart';

import '../domain/chat.dart';

abstract class IChatService {
  Future<List<Chat>> getChats();
}

class ChatServiceMock implements IChatService {
  @override
  Future<List<Chat>> getChats() async {
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

class ChatService implements IChatService {
  final SettingsService _settingsService = GetIt.I.get<SettingsService>();
  final ContactService _contactService = GetIt.I.get<ContactService>();

  @override
  Future<List<Chat>> getChats() async {
    var settings = await _settingsService.getSettings();

    var url = Uri.http('10.0.2.2:8080', 'chats', {'key': settings!.publicKey});

    var response = await http.get(url);
    var jsonArray = const JsonDecoder().convert(response.body);

    List<Chat> chats = [];

    for (int i = 0; i < jsonArray.length; i++) {
      var jsonObj = jsonArray[i];

      var key = jsonObj['key'];
      // var lastMessageText = jsonObj['lastMessageText'];
      // var lastMessageFrom = jsonObj['lastMessageFrom'];
      var lastMessageDate = jsonObj['lastMessageDate'];
      var unread = jsonObj['unread'];

      if (!await _contactService.contactExistsWithKey(key)) {
        continue;
      }

      chats.add(Chat('name', 'avatarUrl', key, 'lastMessageText', DateTime.fromMicrosecondsSinceEpoch(lastMessageDate), unread));
    }
    // fixme
    return chats;
  }
}
