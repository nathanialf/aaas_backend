import '../aaas_backend.dart';
import './project.dart';
import './route.dart';

class Database extends ManagedObject<_Database> implements _Database {}

class _Database {
  // Primary Key
  @primaryKey
  int id;

  // Other Columns
  String endpoint;
  String uname;
  String pass; //NEEDS ENCRYPTED
  int active;

  @Relate(#databases)
  Project project;

  ManagedSet<Route> routes;
}
