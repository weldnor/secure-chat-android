import 'package:secure_chat/repository/contact_repository.dart';

import '../domain/contact.dart';

abstract class AbstractContactService {
  Future<List<Contact>> getContacts();

  Future<void> addContact(Contact contact);
}

class ContactService implements AbstractContactService {
  ContactRepository repository = ContactRepository();

  @override
  Future<List<Contact>> getContacts() {
    return repository.getContacts();
  }

  @override
  Future<void> addContact(Contact contact) {
    return repository.addContact(contact);
  }
}
