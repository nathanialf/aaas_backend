import '../aaas_backend.dart';

class User extends ManagedObject<_User> implements _User, HTTPSerializable {}

class _User {
  @managedPrimaryKey
  int user_id;

  String user_email;
  String user_fname;
  String user_lname;
  String user_pass;
  int user_active;
}
