import '../aaas_backend.dart';
import '../model/user.dart';

class UserController extends HTTPController {
  @httpGet
  Future<Response> getAllUsers() async
  {
    var userQuery = new Query<User>();

    var databaseUsers = await userQuery.fetch();
    return new Response.ok(databaseUsers);
  }

  @httpGet
  Future<Response> getUserAtIndex(@HTTPPath("index") int index) async {
    var userQuery = new Query<User>()
      ..where.user_id = whereEqualTo(index); // `whereEqualTo()` query matchers

    var user = await userQuery.fetchOne();

    if (user == null) {
      return new Response.notFound(body: '<h1>404 Not Found</h1>')
        ..contentType = ContentType.HTML;
    }
    return new Response.ok(user);
  }
}
