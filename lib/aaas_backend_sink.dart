import 'aaas_backend.dart';
import 'controller/user_controller.dart';

/// This class handles setting up this application.
///
/// Override methods from [RequestSink] to set up the resources your
/// application uses and the routes it exposes.
///
/// See the documentation in this file for the constructor, [setupRouter] and [willOpen]
/// for the purpose and order of the initialization methods.
///
/// Instances of this class are the type argument to [Application].
/// See http://aqueduct.io/docs/http/request_sink
/// for more details.
class AaasBackendSink extends RequestSink {
  ManagedContext context;
  
  /// Constructor called for each isolate run by an [Application].
  ///
  /// This constructor is called for each isolate an [Application] creates to serve requests.
  /// The [appConfig] is made up of command line arguments from `aqueduct serve`.
  ///
  /// Configuration of database connections, [HTTPCodecRepository] and other per-isolate resources should be done in this constructor.
  AaasBackendSink(ApplicationConfiguration appConfig) : super(appConfig) {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    AaasBackendConfiguration config = new AaasBackendConfiguration("config.yaml");

    var dataModel = new ManagedDataModel.fromCurrentMirrorSystem();

    var persistentStore = new PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username, config.database.password, config.database.host, config.database.port, config.database.databaseName);

    context = new ManagedContext(dataModel, persistentStore);
  }

  /// All routes must be configured in this method.
  ///
  /// This method is invoked after the constructor and before [willOpen] Routes must be set up in this method, as
  /// the router gets 'compiled' after this method completes and routes cannot be added later.
  @override
  void setupRouter(Router router) {
    router
        .route('/user/[:index]')
        .generate(() => new UserController(context));

    // Prefer to use `pipe` and `generate` instead of `listen`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router.route("/example").listen((request) async {
      return new Response.ok({"key": "value"});
    });
  }

  /// Final initialization method for this instance.
  ///
  /// This method allows any resources that require asynchronous initialization to complete their
  /// initialization process. This method is invoked after [setupRouter] and prior to this
  /// instance receiving any requests.
  @override
  Future willOpen() async {
    try{
      await createDatabaseSchema(context);
    } catch(e){
      
    }
  }

  static Future createDatabaseSchema(ManagedContext context) async {
    var builder = new SchemaBuilder.toSchema(
      context.persistentStore,
      new Schema.fromDataModel(context.dataModel),
      isTemporary: false,
    );

    for (var cmd in builder.commands) {
      await context.persistentStore.execute(cmd);
    }
  }
}

class AaasBackendConfiguration extends ConfigurationItem {
  AaasBackendConfiguration(String fileName) : super.fromFile(fileName);

  DatabaseConnectionConfiguration database;
}