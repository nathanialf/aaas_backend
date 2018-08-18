import '../aaas_backend.dart';
import './route.dart';

class Variable extends ManagedObject<_Variable> implements _Variable {}

class _Variable {
  // Primary Key
  @primaryKey
  int id;

  // Other Columns
  String dataType;
  String name;
  int active;

  @Relate(#variables)
  Route route;
}
