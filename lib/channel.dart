import 'aaas_backend.dart';
import 'controller/user_controller.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class AaasBackendChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  static AaasBackendConfiguration config = AaasBackendConfiguration("config.yaml");
  static ManagedDataModel dataModel = ManagedDataModel.fromCurrentMirrorSystem();
  static DatabaseConfiguration database = config.aaasBackendDev;
  
  static PostgreSQLPersistentStore persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      database.username, database.password, database.host, database.port, database.databaseName);

  ManagedContext context = ManagedContext(dataModel, persistentStore);
  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    router
        .route('/user[/:index]')
        .link(() => UserController(context));

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    return router;
  }
}

// Reads from config.yaml so we can hide passwords and such in a file that is not in github
class AaasBackendConfiguration extends Configuration {
  AaasBackendConfiguration(String fileName) : super.fromFile(File(fileName));

  DatabaseConfiguration aaasBackendProd;
  DatabaseConfiguration aaasBackendDev;

  String dbEnvironment;
}