import '../aaas_backend.dart';
import '../model/user.dart';

class UserController extends HTTPController {
  UserController(this.context);

  final ManagedContext context;

  @httpGet
  Future<Response> getAllUsers() async
  {
    var userQuery = new Query<User>(context);
    return new Response.ok(await userQuery.fetch());
  }

  @httpGet
  Future<Response> getUserAtIndex(@HTTPPath("index") int index) async {
    var userQuery = new Query<User>(context)
      ..where.user_id = whereEqualTo(index); // `whereEqualTo()` query matchers

    var user = await userQuery.fetchOne();

    if (user == null) {
      return new Response.notFound(body: '<h1>404 Not Found</h1>')
        ..contentType = ContentType.HTML;
    }
    return new Response.ok(user);
  }

  @httpPost
  Future<Response> addUser(@HTTPBody() User user) async {
    final Map<String, dynamic> body = await request.body.decodeAsMap();
    var query = new Query<User>(context);
    query..values.user_active = body['user_active'];
    query..values.user_email = body['user_email'];
    query..values.user_fname = body['user_fname'];
    query..values.user_lname = body['user_lname'];
    query..values.user_pass = body['user_pass'];

    var insertedUser = await query.insert();

    var checkInsertedQuery = new Query<User>(context)..where.user_id = whereEqualTo(insertedUser.user_id);
    return new Response.ok(await checkInsertedQuery.fetchOne());
  }
}