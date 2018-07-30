import 'package:aaas_backend/aaas_backend.dart';

class UserController extends HTTPController{
	@httpGet
	Future<Response> getUsers() async {
		var userQuery = new Query<User>();
		List<User> users = await userQuery.fetch();

		return new Response.ok(users);
	}

	@httpGet
        Future<Response> getUsers(@HTTPPath("user_id") int id) async {
                var userQuery = new Query<User>()
			..where.user_id = whereEqualTo(id);
                var User user = await userQuery.fetchOne();

		if(user == null)
			return new Response.notFound();

                return new Response.ok(user);
        }
}
