import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String publicKey;
  @HiveField(2)
  String privateKey;
  @HiveField(3)
  String avatarUrl;

  Settings(this.name, this.publicKey, this.privateKey, this.avatarUrl);

  @override
  String toString() {
    return 'Settings{name: $name, publicKey: $publicKey, privateKey: $privateKey, avatarUrl: $avatarUrl}';
  }
}