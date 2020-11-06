import 'package:chat_app/global/environment.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/model/users_response.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<User>> getUsers() async {
    try {
      final http.Response reponse = await http
          .get('${Environment.apiUrl}/users', headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      });

      final UsersResponse usersResponse = usersResponseFromJson(reponse.body);
      return usersResponse.users;
    } catch (e) {
      return [];
    }
  }
}
