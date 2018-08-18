import '../aaas_backend.dart';
import './database.dart';
import './variable.dart';

class Route extends ManagedObject<_Route> implements _Route {}

class _Route {
  // Primary Key
  @primaryKey
  int id;

  // Other Columns
  String contentType;
  String query;
  int active;

  @Relate(#routes)
  Database database;

  ManagedSet<Variable> variables;
}
