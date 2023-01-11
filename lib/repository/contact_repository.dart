import 'package:hive/hive.dart';

import '../domain/contact.dart';

abstract class AbstractContactRepository {
  Future<List<Contact>?> getContacts();

  Future<void> addContact(Contact contact);

  Future<void> deleteContacts();

  Future<bool> contactExistsWithKey(String key);
}

class ContactRepository extends AbstractContactRepository {
  @override
  Future<List<Contact>> getContacts() async {
    var box = await Hive.openBox<Contact>('contacts');
    return List.of(box.values);
  }

  @override
  Future<void> addContact(Contact contact) async {
    var box = await Hive.openBox<Contact>('contacts');
    await box.add(contact);
  }

  @override
  Future<void> deleteContacts() async {
    var box = await Hive.openBox<Contact>('contacts');
    await box.clear();
  }

  @override
  Future<bool> contactExistsWithKey(String key) async {
    var contacts = await getContacts();

    for (int i = 0; i < contacts.length; i++) {
      if (contacts[i].publicKey == key) return true;
    }
    return false;
  }

  Future<Contact> getContact(key) async{
    var contacts = await getContacts();

    for (int i = 0; i < contacts.length; i++) {
      if (contacts[i].publicKey == key) return contacts[i];
    }
    throw Error();
  }
}
