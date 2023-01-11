import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_chat/domain/message.dart';
import 'package:secure_chat/service/message_service.dart';

class ChatPage extends StatefulWidget {
  final String publicKey;

  const ChatPage(this.publicKey, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChatPageState();
  }
}

class _ChatPageState extends State<ChatPage> {
  final IMessageService _messageService = GetIt.I.get<IMessageService>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = 'Enter message...';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.publicKey)),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Message>>(
                future: _messageService.getMessages(widget.publicKey),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        bool isOwnMessage =
                            snapshot.data![index].from == widget.publicKey;

                        return Row(
                          mainAxisAlignment: isOwnMessage
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: isOwnMessage
                                          ? Colors.grey
                                          : Colors.blue,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(snapshot.data![index].text)),
                            )
                          ],
                        );
                      },
                    );
                  }
                  return const Text('loading...');
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _textEditingController,
                  onSubmitted: (text) {
                    _messageService.addMessage(widget.publicKey, text);
                  },
                ))
              ],
            )
          ],
        )));
  }
}
