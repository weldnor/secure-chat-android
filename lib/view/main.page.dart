import 'package:flutter/material.dart';
import 'package:secure_chat/view/chats_page.dart';
import 'package:secure_chat/view/contacts_page.dart';
import 'package:secure_chat/view/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int index = 1;

  final screens  = const [
    ChatsPage(),
    ContactsPage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (value) => setState(() => {index = value}),
            destinations: const [
          NavigationDestination(
              icon: Icon(Icons.mail),
              selectedIcon: Icon(Icons.mail_outline),
              label: 'chats'),
          NavigationDestination(
              icon: Icon(Icons.people),
              selectedIcon: Icon(Icons.people_outline),
              label: 'contacts'),
          NavigationDestination(
              icon: Icon(Icons.settings),
              selectedIcon: Icon(Icons.settings_outlined),
              label: 'settings'),
        ]),
        body: screens[index]
    );

  }
}
