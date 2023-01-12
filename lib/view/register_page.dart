import 'package:crypton/crypton.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_chat/domain/settings.dart';
import 'package:secure_chat/view/main.page.dart';

import '../service/settings_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _nick = '';
  final _settingsService = GetIt.I.get<SettingsService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(children: [
          Expanded(
              child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(top: 60),
              child: SizedBox(
                  width: 135,
                  height: 135,
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(
                        'https://cdn.icon-icons.com/icons2/2591/PNG/512/hacker_anonymous_icon_154428.png'),
                    backgroundColor: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Choice your nick'),
                      ),
                    ],
                  ),
                  TextField(
                    onChanged: _onNickChanged,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Bryan",
                    ),
                  )
                ],
              ),
            ),
          ])),
          Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () =>
                      _validate() ? onRegisterButtonClicked(context) : null,
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      minimumSize: const Size.fromHeight(55)),
                  child: const Text('Next')))
        ])));
  }

  _onNickChanged(text) {
    setState(() {
      _nick = text;
    });
  }

  bool _validate() {
    return _nick.isNotEmpty;
  }

  Future<dynamic> onRegisterButtonClicked(BuildContext context) {
    // todo move to service
    RSAKeypair rsaKeypair = RSAKeypair.fromRandom();
    var publicKey = rsaKeypair.publicKey.toString();
    var privateKey = rsaKeypair.privateKey.toString();
    // todo fix it
    var avatarUrl =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU';

    // save user info
    var settings = Settings(_nick, publicKey, privateKey, avatarUrl);
    _settingsService.saveSettings(settings);

    // go to main page
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MainPage(),
    ));
  }
}
