import 'package:bite_sized/modules/models/LoginDTO.dart';

import 'base_service.dart';
import 'package:http/http.dart' as http;

class LoginService extends BaseService {
  Future<http.Response> authenticate(Login login) {

    print('LOGIN');
    print(loginToJson(login));
    return request(
      HttpMethod.POST,
      'https://login-api-dam.herokuapp.com/auth/authenticate',
      loginToJson(login),
    ).then((value){
      print('into service');
      print(value);

      return value;
    });
  }
}
