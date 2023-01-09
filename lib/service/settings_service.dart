import 'package:secure_chat/repository/settings_repository.dart';

import '../domain/settings.dart';

class SettingsService {
  SettingsRepository repository = SettingsRepository();

  Future<Settings?> getSettings() {
    return repository.getSettings();
  }

  Future<void> saveSettings(Settings settings) {
    return repository.saveSettings(settings);
  }

  Future<void> deleteSettings() {
    return repository.deleteSettings();
  }
}
