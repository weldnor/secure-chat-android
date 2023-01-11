import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:secure_chat/domain/message.dart';
import 'package:secure_chat/service/settings_service.dart';

import 'package:http/http.dart' as http;

abstract class IMessageService {
  Future<List<Message>> getMessages(String key);

  Future<void> addMessage(String key, String text);
}

class MessageServiceMock implements IMessageService {
  @override
  Future<List<Message>> getMessages(String key) async {
    return [
      Message('key1', 'key2', 'hello dart!'),
      Message('key1', 'key2', 'hello world!')
    ];
  }

  @override
  Future<void> addMessage(String key, String text) {
    throw UnimplementedError();
  }
}

class MessageService implements IMessageService {
  final SettingsService _settingsService = GetIt.I.get<SettingsService>();

  @override
  Future<List<Message>> getMessages(String key) async {
    var settings = await _settingsService.getSettings();

    var url = Uri.http('10.0.2.2:8080', 'messages',
        {'key1': settings!.publicKey, 'key2': key});
    var response = await http.get(url);
    var parsedJson = const JsonDecoder().convert(response.body);
    return parseMessages(parsedJson);
  }

  List<Message> parseMessages(List<dynamic> rawMessages) {
    List<Message> result = [];

    for (int i = 0; i < rawMessages.length; i++) {
      String from = rawMessages[i]['from'];
      String to = rawMessages[i]['to'];
      String text = rawMessages[i]['text'];
      result.add(Message(from, to, text));
    }
    return result;
  }

  @override
  Future<void> addMessage(String key, String text) async {
    var settings = await _settingsService.getSettings();

    var url = Uri.http('10.0.2.2:8080', 'messages');

    var headers = {"Content-Type": "application/json"};
    var body =
        jsonEncode({'from': settings!.publicKey, 'to': key, 'text': text});

    await http.put(url, headers: headers, body: body);
  }
}
