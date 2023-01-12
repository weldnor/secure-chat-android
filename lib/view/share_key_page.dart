import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:secure_chat/service/settings_service.dart';

class ShareKeyPage extends StatefulWidget {
  const ShareKeyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ShareKeyPageState();
  }
}

class _ShareKeyPageState extends State<ShareKeyPage> {
  var settingsService = GetIt.I.get<SettingsService>();

  Future<String> generateSharedJson() async {
    var settings = await settingsService.getSettings();

    if (settings == null) {
      throw Exception('settings is null');
    }

    var data = const JsonEncoder().convert({
      'name': settings.name,
      'avatarUrl': settings.avatarUrl,
      'publicKey': settings.publicKey,
    });

    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Share Public Key')),
        body: SafeArea(
            child: FutureBuilder<String>(
                future: generateSharedJson(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: QrImage(
                          data: snapshot.data!,
                          version: QrVersions.auto,
                        ),
                      ),
                    );
                  }
                  return Container();
                })));
  }
}
