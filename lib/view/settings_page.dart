import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_chat/view/intro_page.dart';
import 'package:secure_chat/view/share_key_page.dart';

import '../domain/settings.dart';
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
        body: SingleChildScrollView(
      //hack
      child: SafeArea(
        child: FutureBuilder<Settings?>(
          future: _settingsService.getSettings(),
          builder: (context, snapshot) {
            var settings = snapshot.data;

            if (snapshot.hasData) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Text('Settings', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: SizedBox(
                          width: 135,
                          height: 135,
                          child: CircleAvatar(
                            foregroundImage: NetworkImage(settings!.avatarUrl),
                            backgroundColor: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: TextField(
                                onChanged: (value) {
                                  //todo move logic to method
                                  _name = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[300],
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "Bryan",
                                ),
                              ),
                            ),
                          ),
                          MaterialButton(
                            color: Colors.blue[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            onPressed: onSaveNickButtonClicked,
                            child: const Text('save'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          onPressed: onShowPublicKeyButtonClicked,
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.blue[100],
                              foregroundColor: Colors.grey[800],
                              minimumSize: const Size.fromHeight(55)),
                          child: const Text('Show public key'),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          onPressed: onDeleteAccountButtonClicked,
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              foregroundColor: Colors.grey[800],
                              backgroundColor: Colors.red[100],
                              minimumSize: const Size.fromHeight(55)),
                          child: const Text('Delete account'),
                        ))
                  ]);
            }
            return Container();
          },
        ),
      ),
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
