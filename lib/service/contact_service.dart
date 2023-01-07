class Contact {
  String avatarUrl;
  String name;

  Contact(this.avatarUrl, this.name);

  @override
  String toString() {
    return 'Contact{avatarUrl: $avatarUrl, name: $name}';
  }
}

abstract class AbstractContactService {
  List<Contact> getContacts();
}

class ContactService implements AbstractContactService {
  @override
  List<Contact> getContacts() {
    return [
      Contact('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU', 'Anthony'),
      Contact('https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png', 'Bryan'),
      Contact('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSurwho7zsjHiiB2dUTQfuBJ075piTV0aYUQoB3jklw5_4nIiT8WceNEET6hg5YNElL8ks&usqp=CAU', 'Brianna'),
      Contact('https://img.freepik.com/vector-premium/retrato-avatar-hombre-joven-caucasico-marco-redondo-ilustracion-plana-dibujos-animados-vector_551425-19.jpg?w=2000', 'Diana'),
      Contact('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU', 'Anthony'),
      Contact('https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png', 'Bryan'),
      Contact('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSurwho7zsjHiiB2dUTQfuBJ075piTV0aYUQoB3jklw5_4nIiT8WceNEET6hg5YNElL8ks&usqp=CAU', 'Brianna'),
      Contact('https://img.freepik.com/vector-premium/retrato-avatar-hombre-joven-caucasico-marco-redondo-ilustracion-plana-dibujos-animados-vector_551425-19.jpg?w=2000', 'Diana'),
      Contact('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU', 'Anthony'),
      Contact('https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png', 'Bryan'),
      Contact('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSurwho7zsjHiiB2dUTQfuBJ075piTV0aYUQoB3jklw5_4nIiT8WceNEET6hg5YNElL8ks&usqp=CAU', 'Brianna'),
      Contact('https://img.freepik.com/vector-premium/retrato-avatar-hombre-joven-caucasico-marco-redondo-ilustracion-plana-dibujos-animados-vector_551425-19.jpg?w=2000', 'Diana'),
      Contact('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU', 'Anthony'),
      Contact('https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png', 'Bryan'),
      Contact('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSurwho7zsjHiiB2dUTQfuBJ075piTV0aYUQoB3jklw5_4nIiT8WceNEET6hg5YNElL8ks&usqp=CAU', 'Brianna'),
      Contact('https://img.freepik.com/vector-premium/retrato-avatar-hombre-joven-caucasico-marco-redondo-ilustracion-plana-dibujos-animados-vector_551425-19.jpg?w=2000', 'Diana'),
      Contact('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU', 'Anthony'),
      Contact('https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png', 'Bryan'),
      Contact('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSurwho7zsjHiiB2dUTQfuBJ075piTV0aYUQoB3jklw5_4nIiT8WceNEET6hg5YNElL8ks&usqp=CAU', 'Brianna'),
      Contact('https://img.freepik.com/vector-premium/retrato-avatar-hombre-joven-caucasico-marco-redondo-ilustracion-plana-dibujos-animados-vector_551425-19.jpg?w=2000', 'Diana'),
      Contact('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqWIPKg9kRQhn9r3qgpcRSACAXvg-dbTOWQiDN6b5ahLRZ-AU_ioL_uXv5Un0kNGPNhE&usqp=CAU', 'Anthony'),
      Contact('https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png', 'Bryan'),
      Contact('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSurwho7zsjHiiB2dUTQfuBJ075piTV0aYUQoB3jklw5_4nIiT8WceNEET6hg5YNElL8ks&usqp=CAU', 'Brianna'),
      Contact('https://img.freepik.com/vector-premium/retrato-avatar-hombre-joven-caucasico-marco-redondo-ilustracion-plana-dibujos-animados-vector_551425-19.jpg?w=2000', 'Diana'),
    ];
  }
}
