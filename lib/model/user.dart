import '../aaas_backend.dart';

class User extends ManagedObject<_User> implements _User {}

class _User {
  // Primary Key
  @primaryKey
  int id;

  // Unique Column
  @Column(unique: true)
  String email;

  // Other Columns
  String fname;
  String lname;
  String pass; //NEEDS ENCRYPTED
  DateTime created;
  int active;
}
