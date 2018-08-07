import '../aaas_backend.dart';

class User extends ManagedObject<_User> implements _User, HTTPSerializable {}

class _User {
  // Primary Key
  @managedPrimaryKey
  int id;

  // Unique Column
  @ManagedColumnAttributes(unique: true)
  String email;

  // Other Columns
  String fname;
  String lname;
  String pass; //NEEDS ENCRYPTED
  DateTime created;
  int active;
}
