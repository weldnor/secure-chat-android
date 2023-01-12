import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_chat/service/contact_service.dart';
import 'package:secure_chat/view/chat_page.dart';

import '../domain/contact.dart';
import 'add_contact_page.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContactsPageState();
  }
}

class _ContactsPageState extends State<ContactsPage> {
  var contactService = GetIt.I.get<ContactService>();

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
              child: FutureBuilder<List<Contact>>(
                  future: contactService.getContacts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var contacts = snapshot.data!;

                      return ListView.builder(
                        itemCount: contacts.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              onContactClicked(contacts[index]);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  child: Row(children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                contacts[index].avatarUrl)),
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
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  })),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: onAddContactButtonPressed, child: const Icon(Icons.add)),
    );
  }

  onContactClicked(Contact contact){
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ChatPage(contact.publicKey),
    ));
  }

  onAddContactButtonPressed() {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AddContactPage(),
    ));
  }
}
