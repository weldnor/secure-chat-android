import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_chat/service/contact_service.dart';
import 'package:secure_chat/view/main.page.dart';

import '../domain/contact.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddContactPageState();
  }
}

class _AddContactPageState extends State<AddContactPage> {
  final ContactService _contactService = GetIt.I.get<ContactService>();
  var _data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add Contact')),
        body: SafeArea(
            child: Column(
          children: [
            TextField(onChanged: (value) {
              _data = value;
            }),
            MaterialButton(
              onPressed: tryToAddContact,
              child: const Text('add contact'),
            )
          ],
        )));
  }

  void tryToAddContact() {
    var json = const JsonDecoder().convert(_data);
    String name = json['name'];
    String publicKey = json['publicKey'];
    String avatarUrl = json['avatarUrl'];

    var contact = Contact(name, publicKey, avatarUrl);
    _contactService.addContact(contact);

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MainPage(),
    ));
  }
}
