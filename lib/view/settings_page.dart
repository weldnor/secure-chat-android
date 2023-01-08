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
          children: const [
            Text('Settings'),
          ],
        ),
        Row(
          children: const [
            Center(
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU')),
            )
          ],
        ),
        Row(
          children: [
            const Expanded(
              child: TextField(),
            ),
            Column(
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: const Text('save'),
                )
              ],
            )
          ],
        ),
        Row(
          children: [
            MaterialButton(
                onPressed: onDeleteAccountButtonClicked,
                child: const Text('Show public key'))
          ],
        ),
        Row(
          children: [
            MaterialButton(
                onPressed: onDeleteAccountButtonClicked,
                child: const Text('Delete account'))
          ],
        )
      ]),
    ));
  }

  onDeleteAccountButtonClicked() {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ShareKeyPage(),
    ));
  }
}
