import 'package:flutter/material.dart';

class ShareKeyPage extends StatefulWidget {
  const ShareKeyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ShareKeyPageState();
  }
}

class _ShareKeyPageState extends State<ShareKeyPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea( child: Text('Share key page'))
    );

  }
}
