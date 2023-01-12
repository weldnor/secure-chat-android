import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_chat/service/chat_service.dart';
import 'package:secure_chat/view/chat_page.dart';

import '../domain/chat.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChatsPageState();
  }
}

class _ChatsPageState extends State<ChatsPage> {
  final IChatService _chatService = GetIt.I.get<IChatService>();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      update();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        FutureBuilder(
            future: _chatService.getChats(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var chats = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: chats!.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          onChatClicked(chats[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(chats[index].avatarUrl),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  Row(children: [Text(chats[index].name)]),
                                  Row(
                                    children: [
                                      Text(chats[index].lastMessageText)
                                    ],
                                  )
                                ]),
                              ),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(children: [
                                    Text(chats[index]
                                        .getLastMessageDateAsString()),
                                  ]),
                                  Visibility(
                                    visible: chats[index].unread > 0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            color: Colors.blue),
                                        child: Center(
                                            child: Text(
                                          chats[index].unread.toString(),
                                          style: const TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                  ),
                                ])
                          ]),
                        ),
                      );
                    },
                  ),
                );
              }
              return Container();
            })
      ]),
    ));
  }

  void onChatClicked(Chat chat) {
    // todo fix click area
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ChatPage(chat.publicKey)));
  }

  update() {
    setState(() {
      //nothing
    });
  }
}
