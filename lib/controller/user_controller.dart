import '../aaas_backend.dart';
import '../model/user.dart';

class UserController extends HTTPController {
  UserController(this.context);

  final ManagedContext context;

  // Returns all users
  @httpGet
  Future<Response> getAllUsers() async
  {
    var userQuery = new Query<User>(context);
    return new Response.ok(await userQuery.fetch());
  }

  // Returns single user
  @httpGet
  Future<Response> getUserAtIndex(@HTTPPath("index") int index) async {
    var userQuery = new Query<User>(context)
      ..where.id = whereEqualTo(index); // `whereEqualTo()` query matchers

    var user = await userQuery.fetchOne();

    if (user == null) {
      return new Response.notFound(body: '<h1>404 Not Found</h1>')
        ..contentType = ContentType.HTML;
    }
    return new Response.ok(user);
  }

  // adds user to db
  // returns created user
  @httpPost
  Future<Response> addUser(@HTTPBody() User user) async {
    // datetime created here
    user.created = new DateTime.now();
    var query = new Query<User>(context)..values = user;

    var insertedUser = await query.insert();

    var checkInsertedQuery = new Query<User>(context)..where.id = whereEqualTo(insertedUser.id);
    return new Response.ok(await checkInsertedQuery.fetchOne());
  }
}