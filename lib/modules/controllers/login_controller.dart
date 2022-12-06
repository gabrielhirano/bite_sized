import 'package:bite_sized/modules/models/LoginDTO.dart';
import 'package:bite_sized/modules/screens/home_screen.dart';
import 'package:bite_sized/modules/screens/main_screen.dart';
import 'package:bite_sized/modules/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final _loginService = LoginService();

  @observable
  Login login = Login(email: '', password: '');

  @action
  void setLogin(String value) => login.email = value;

  @action
  void setPassWord(String value) => login.password = value;

  @observable
  bool passwordVisible = true;

  @action
  void changePasswordVisibility() => passwordVisible = !passwordVisible;

  authenticateCredentials(BuildContext context) async {
    _loginService.authenticate(login).then((response) {
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ));
      }
    });
  }
}
