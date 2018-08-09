import '../aaas_backend.dart';
import '../model/user.dart';

class UserController extends ResourceController {
  UserController(this.context);

  final ManagedContext context;

  // Returns all users
  @Operation.get()
  Future<Response> getAllUsers() async
  {
    final userQuery = Query<User>(context);
    return Response.ok(await userQuery.fetch());
  }

  // Returns single user
  @Operation.get("index")
  Future<Response> getUserAtIndex() async {
    final id = int.parse(request.path.variables['index']);
    final userQuery = Query<User>(context)
      ..where((u) => u.id).equalTo(id);

    final user = await userQuery.fetchOne();

    if (user == null) {
      return Response.notFound(body: '<h1>404 Not Found</h1>');
    }
    return Response.ok(user);
  }
  /*
  // Returns single user from login
  @Operation.get()
  Future<Response> getUserForLogin(@Bind.path("email") String email, @Bind.path("pass") String pass) async {
    var userQuery = new Query<User>(context)
      ..where.email = whereEqualTo(email)..where.pass = whereEqualTo(pass); // `whereEqualTo()` query matchers

    var user = await userQuery.fetchOne();

    if (user == null) {
      return new Response.notFound(body: '<h1>404 Not Found</h1>')
        ..contentType = ContentType.HTML;
    }
    return new Response.ok(user);
  }
  */

  // adds user to db
  // returns created user
  @Operation.post()
  Future<Response> addUser(@Bind.body() User user) async {
    // datetime created here
    user.created = DateTime.now();
    final query = Query<User>(context)..values = user;

    final insertedUser = await query.insert();

    final checkInsertedQuery = Query<User>(context)
      ..where((u) => u.id).equalTo(insertedUser.id);
    return Response.ok(await checkInsertedQuery.fetchOne());
  }
}