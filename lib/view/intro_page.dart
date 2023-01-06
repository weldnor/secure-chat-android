import 'package:flutter/material.dart';
import 'package:secure_chat/view/register_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Welcome to secure chat!',
              style: TextStyle(fontSize: 20),
            )
          ],
        )),
        Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () => goToRegisterPage(context),
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: const Size.fromHeight(55)),
              child: const Text('Register'),
            )),
      ]),
    ));
  }

  Future<dynamic> goToRegisterPage(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>  const RegisterPage(),
    ));
  }
}
