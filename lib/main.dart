import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:secure_chat/service/chat_service.dart';
import 'package:secure_chat/service/contact_service.dart';
import 'package:secure_chat/service/message_service.dart';
import 'package:secure_chat/service/settings_service.dart';
import 'package:secure_chat/view/intro_page.dart';
import 'package:get_it/get_it.dart';

import 'domain/settings.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

init() async {
  await initDatabase();
  initDependencies();
}

Future<void> initDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
}

void initDependencies() {
  GetIt.I.registerSingleton<ChatService>(ChatService());
  GetIt.I.registerSingleton<ContactService>(ContactService());
  GetIt.I.registerSingleton<MessageService>(MessageService());
  GetIt.I.registerSingleton<SettingsService>(SettingsService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
