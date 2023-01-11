import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:secure_chat/domain/contact.dart';
import 'package:secure_chat/service/chat_service.dart';
import 'package:secure_chat/service/contact_service.dart';
import 'package:secure_chat/service/message_service.dart';
import 'package:secure_chat/service/settings_service.dart';
import 'package:secure_chat/view/intro_page.dart';
import 'package:secure_chat/view/main.page.dart';

import 'domain/settings.dart';

void main() async {
  await init();
  runApp(MyApp());
}

init() async {
  await initDatabase();
  initDependencies();
}

Future<void> initDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(ContactAdapter());
}

void initDependencies() {
  GetIt.I.registerSingleton<SettingsService>(SettingsService());
  GetIt.I.registerSingleton<ChatService>(ChatService());
  GetIt.I.registerSingleton<ContactService>(ContactService());
  GetIt.I.registerSingleton<IMessageService>(MessageService());
}

class MyApp extends StatelessWidget {
  final SettingsService _settingsService = GetIt.I.get<SettingsService>();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: _settingsService.isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data! ? const MainPage() : const IntroPage();
          }
          return const Text('loading...');
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
