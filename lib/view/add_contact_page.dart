import 'package:flutter/material.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddContactPageState();
  }
}

class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: Text('Add contact Page')));
  }
}
