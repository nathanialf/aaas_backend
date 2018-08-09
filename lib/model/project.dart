import '../aaas_backend.dart';

class Project extends ManagedObject<_Project> implements _Project {}

class _Project {
  // Primary Key
  @primaryKey
  int id;

  // Unique Column
  @Column(unique: true)
  String code;

  // Other Columns
  String name;
  int active;
}
