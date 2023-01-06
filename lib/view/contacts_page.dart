import 'package:flutter/material.dart';

import 'add_contact_page.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContactsPageState();
  }
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Contacts',
                style: TextStyle(fontSize: 20),
              )
            ],
          )),
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
