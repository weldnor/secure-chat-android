import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String publicKey;

  const ChatPage(this.publicKey, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChatPageState();
  }
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.publicKey)),
        body: SafeArea(child: Text(widget.publicKey)));
  }
}
