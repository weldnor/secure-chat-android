import 'package:flutter/material.dart';
import 'package:secure_chat/view/register_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Welcome to secure chat!',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: const Text('Register'),
                onPressed: () => {goToRegisterPage(context)})
          ],
        ),
      ]),
    ));
  }

  Future<dynamic> goToRegisterPage(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const RegisterPage(),
    ));
  }
}
