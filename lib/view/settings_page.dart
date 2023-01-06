import 'package:flutter/material.dart';
import 'package:secure_chat/view/share_key_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Row(
          children: [
            MaterialButton(
                onPressed: goToShareKeyPage,
                child: const Text('Show public key'))
          ],
        )
      ]),
    ));
  }

  goToShareKeyPage() {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ShareKeyPage(),
    ));
  }
}
