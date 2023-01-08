import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:secure_chat/view/intro_page.dart';

import 'domain/settings.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

init() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
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
