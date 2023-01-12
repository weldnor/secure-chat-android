import 'dart:convert';

import 'package:crypton/crypton.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_chat/domain/message.dart';
import 'package:secure_chat/repository/sent_message_repository.dart';
import 'package:secure_chat/service/settings_service.dart';

import 'package:http/http.dart' as http;

abstract class IMessageService {
  Future<List<Message>> getMessages(String key);

  Future<List<Message>> getSentMessages(String key);

  Future<void> addMessage(String key, String text);

  Future<String> decryptMessage(String text);

  Future<void> deleteSentMessages();
}

class MessageService implements IMessageService {
  final SettingsService _settingsService = GetIt.I.get<SettingsService>();
  final SentMessageRepository _sentMessageRepository = SentMessageRepository();

  @override
  Future<List<Message>> getMessages(String key) async {
    var settings = await _settingsService.getSettings();

    var url = Uri.http('10.0.2.2:8080', 'messages',
        {'key1': settings!.publicKey, 'key2': key});

    var response = await http.get(url);
    var parsedJsonArray = const JsonDecoder().convert(response.body);

    List<Message> messages = [];

    for (int i = 0; i < parsedJsonArray.length; i++) {
      var parsedJsonObj = parsedJsonArray[i];
      String from = parsedJsonObj['from'];
      String to = parsedJsonObj['to'];
      String text = parsedJsonObj['text'];
      int timestamp = parsedJsonObj['timestamp'];

      if (from == settings.publicKey) {
        //skip my messages
        continue;
      }

      String decryptedText = await decryptMessage(text);
      messages.add(Message(from, to, decryptedText, timestamp));
    }

    // merge my messages
    messages.addAll(await getSentMessages(key));

    messages.sort((a, b) => a.timestamp > b.timestamp ? 1 : -1);

    return messages;
  }

  @override
  Future<void> addMessage(String key, String text) async {
    var settings = await _settingsService.getSettings();
    var timestamp = DateTime.now().millisecondsSinceEpoch;


    // add message to local storage
    _sentMessageRepository.addSentMessage(Message(settings!.publicKey, key, text, timestamp));



    var url = Uri.http('10.0.2.2:8080', 'messages');

    var headers = {"Content-Type": "application/json"};

    var publicKeyObj = RSAPublicKey.fromString(key);
    var encryptedText = publicKeyObj.encrypt(text);

    var body = jsonEncode(
        {'from': settings.publicKey, 'to': key, 'text': encryptedText, 'timestamp': timestamp});

    await http.put(url, headers: headers, body: body);
  }

  @override
  Future<String> decryptMessage(String text) async {
    var settings = await _settingsService.getSettings();

    var privateKeyObj = RSAPrivateKey.fromString(settings!.privateKey);
    return privateKeyObj.decrypt(text);
  }

  @override
  Future<List<Message>> getSentMessages(String key) {
    return _sentMessageRepository.getSentMessages(key);
  }

  @override
  Future<void> deleteSentMessages() {
    return _sentMessageRepository.deleteSentMessages();
  }
}
