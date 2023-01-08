import 'package:hive/hive.dart';

import '../domain/settings.dart';

abstract class AbstractSettingsRepository {
  Future<Settings?> getSettings();

  Future<void> saveSettings(Settings settings);
}

class SettingsRepository extends AbstractSettingsRepository {
  @override
  Future<Settings?> getSettings() async {
    var box = await Hive.openBox<Settings>('settings');
    return box.get('settings');
  }

  @override
  Future<void> saveSettings(Settings settings) async {
    var box = await Hive.openBox<Settings>('settings');
    await box.put('settings', settings);
  }
}
