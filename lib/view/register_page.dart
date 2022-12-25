import 'package:flutter/material.dart';

import 'main_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Register',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: const Text('Return to main page'),
                onPressed: () => goToMainPage(context))
          ],
        )
      ]),
    ));
  }

  Future<dynamic> goToMainPage(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MainPage(),
    ));
  }
}
