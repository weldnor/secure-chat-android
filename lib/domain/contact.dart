import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 1)
class Contact {
  @HiveField(0)
  String name;
  @HiveField(1)
  String publicKey;
  @HiveField(2)
  String avatarUrl;

  Contact(this.name, this.publicKey, this.avatarUrl);

  @override
  String toString() {
    return 'Contact{name: $name, publicKey: $publicKey, avatarUrl: $avatarUrl}';
  }
}
