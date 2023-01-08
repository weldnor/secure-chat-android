import 'package:secure_chat/repository/settings_repository.dart';

import '../domain/settings.dart';


class SettingsService {
  SettingsRepository repository = SettingsRepository();

  // createUser(String avatarUrl, String name) {
  //   RSAKeypair rsaKeypair = RSAKeypair.fromRandom();
  //   String encrypted = rsaKeypair.publicKey.encrypt('hello world');
  //   print(rsaKeypair.publicKey.toString());
  // }

  Future<Settings?> getSettings() {
    return repository.getSettings();
  }

  Future<void> saveSettings(Settings settings) async {
    repository.saveSettings(settings);
  }
}
