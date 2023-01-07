import 'package:flutter/material.dart';
import 'package:secure_chat/service/contact_service.dart';

import 'add_contact_page.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContactsPageState();
  }
}

class _ContactsPageState extends State<ContactsPage> {
  var contactService = ContactService();
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();

    contacts = contactService.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(children: const [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 24),
              ),
            )
          ]),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: Row(children: [
                        Column(
                          children: [
                            CircleAvatar(
                                backgroundImage:
                                    NetworkImage(contacts[index].avatarUrl)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(contacts[index].name,
                              style: const TextStyle(fontSize: 16)),
                        )
                      ]),
                    )
                  ],
                );
              },
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: onAddContactButtonPressed, child: const Icon(Icons.add)),
    );
  }

  onAddContactButtonPressed() {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AddContactPage(),
    ));
  }
}
