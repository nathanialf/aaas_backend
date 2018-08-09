import '../aaas_backend.dart';
import '../model/project.dart';

class ProjectController extends ResourceController {
  ProjectController(this.context);

  final ManagedContext context;

  // Returns all projects
  @Operation.get()
  Future<Response> getAllProjects() async
  {
    final query = Query<Project>(context);
    return Response.ok(await query.fetch());
  }

  // Returns single user
  @Operation.get("code")
  Future<Response> getProjectByCode() async {
    final code = request.path.variables['code'];
    final query = Query<Project>(context)
      ..where((p) => p.code).equalTo(code);

    final user = await query.fetchOne();

    if (user == null) {
      return Response.notFound(body: '<h1>404 Not Found</h1>');
    }
    return Response.ok(user);
  }

  // adds user to db
  // returns created user
  @Operation.post()
  Future<Response> addUser(@Bind.body() Project project) async {
    // datetime created here
    final query = Query<Project>(context)..values = project;

    final insertedProject = await query.insert();

    final checkInsertedQuery = Query<Project>(context)
      ..where((p) => p.id).equalTo(insertedProject.id);
    return Response.ok(await checkInsertedQuery.fetchOne());
  }
}