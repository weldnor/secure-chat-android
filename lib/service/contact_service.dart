import 'package:secure_chat/repository/contact_repository.dart';

import '../domain/contact.dart';

abstract class AbstractContactService {
  Future<List<Contact>> getContacts();

  Future<void> addContact(Contact contact);

  Future<bool> contactExistsWithKey(String key);

  Future<Contact> getContact(key);

}

class ContactService implements AbstractContactService {
  final ContactRepository _contactRepository = ContactRepository();

  @override
  Future<List<Contact>> getContacts() {
    return _contactRepository.getContacts();
  }

  @override
  Future<void> addContact(Contact contact) {
    return _contactRepository.addContact(contact);
  }

  @override
  Future<bool> contactExistsWithKey(String key) {
    return _contactRepository.contactExistsWithKey(key);
  }

  @override
  Future<Contact> getContact(key) {
    return _contactRepository.getContact(key);
  }
}
