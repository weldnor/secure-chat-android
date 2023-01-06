import 'package:flutter/material.dart';
import 'package:secure_chat/view/main.page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _nick = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Expanded(
          child: Column(children: [
        Row(
          children: const [Text('Choice your nick')],
        ),
        SizedBox(
            child: TextField(
          onChanged: _onNickChanged,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Type in your text",
              fillColor: Colors.white70),
        )),
      ])),
      Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
              onPressed: () => _validate() ? goToMainPage(context) : null,
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

  Future<dynamic> goToMainPage(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MainPage(),
    ));
  }
}
