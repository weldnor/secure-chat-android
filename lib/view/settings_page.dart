import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_chat/view/intro_page.dart';
import 'package:secure_chat/view/share_key_page.dart';

import '../service/settings_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  final _settingsService = GetIt.I.get<SettingsService>();

  var _name = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    var settings = await _settingsService.getSettings();
    if (settings == null) {
      throw Exception('settings is null');
    }
    _name = settings.name;
  }

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
            Expanded(
              child: TextField(onChanged: (value) {
                //todo move logic to method
                _name = value;
              }),
            ),
            Column(
              children: [
                MaterialButton(
                  onPressed: onSaveNickButtonClicked,
                  child: const Text('save'),
                )
              ],
            )
          ],
        ),
        Row(
          children: [
            MaterialButton(
                onPressed: onShowPublicKeyButtonClicked,
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

  onShowPublicKeyButtonClicked() {
    // todo bug? where is context?
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ShareKeyPage(),
    ));
  }

  onDeleteAccountButtonClicked() async {
    await _settingsService.deleteSettings();

    // todo bug? where is context?
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const IntroPage(),
    ));
  }

  onSaveNickButtonClicked() async {
    if (_name.isEmpty) {
      return;
    }

    var settings = await _settingsService.getSettings();
    if (settings == null) {
      throw Exception('settings is null');
    }

    settings.name = _name;
    await settings.save();
  }
}
