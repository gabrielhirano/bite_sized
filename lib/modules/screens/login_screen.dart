import 'package:bite_sized/modules/controllers/login_controller.dart';
import 'package:bite_sized/modules/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:email_validator/email_validator.dart';
// import 'dart:convert';

// import 'package:homebitesized/screens/navscreen/navscreen.dart';
// import 'package:homebitesized/screens/principal/principal.dart';
// import 'package:homebitesized/widgets/background.dart';
// import 'package:homebitesized/screens/register/register.dart';
// import 'package:homebitesized/service/loginService.dart';
// import 'package:homebitesized/dialogs/customDialog.dart';

//import 'package:homebitesized/service/localUserInfoService.dart' as local_user_service;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = LoginController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 30),
              _buildForm(),
            ],
          ),
        ));
  }

  _buildHeader() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Nunito',
            ),
          ),
        )
      ],
    );
  }

  _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Observer(
        builder: (_) {
          return Column(
            children: [
              TextField(
                onChanged: _controller.setLogin,
                decoration: const InputDecoration(
                  hintText: 'Digite seu email',
                  icon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                obscureText: !_controller.passwordVisible,
                onChanged: _controller.setPassWord,
                decoration: InputDecoration(
                  hintText: 'Digite sua senha',
                  icon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                      onTap: _controller.changePasswordVisibility,
                      child: (_controller.passwordVisible == true)
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    print(_controller.login.password);
                    print('Redirect to cadastro');
                  },
                  child: Text('Esqueceu a senha?'),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () async {
                _controller.authenticateCredentials(context);

                },
                child: Container(
                  alignment: AlignmentDirectional.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    'Logar',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    print('Redirect to cadastro');
                  },
                  child: Text('Não possui conta? Cadastrar'),
                ),
              ),
              const SizedBox(height: 60),
              Center(
                child: Column(
                  children: [
                    Text('Ou entre com'),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google-icon.png',
                          width: 60,
                          height: 60,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  _handleSignIn() {}
}
