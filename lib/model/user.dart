import 'package:aaas_backend/aaas_backend.dart';

class User extends ManagedObject<aaas_users> implements aaas_users{

}

class aaas_users {
	@managedPrimaryKey
	int user_id;

	String user_email;
	String user_fname;
	String user_lname;
	String user_password;
	int user_active;
}
