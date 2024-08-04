
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:survey_outlet_app/';
import 'package:survey_outlet_app/login/login.dart';
// import 'package:survey_outlet_app/loading/loading.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _UsernameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return TextField(
      key: const Key('loginForm_usernameInput_textField'),
      controller: controller.usernameController,
      // onChanged: (username) =>
      //     // context.read<LoginBloc>().add(LoginUsernameChanged(username)),
      //     print(username),
      decoration: InputDecoration(
        labelText: 'username',
        // errorText:
        //     state.username.displayError != null ? 'invalid username' : null,
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      controller: controller.passwordController,
      // onChanged: (password) => 
      //     // context.read<LoginBloc>().add(LoginPasswordChanged(password)),
      //     print(password),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'password',
        // errorText:
        //     state.password.displayError != null ? 'invalid password' : null,
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => 
    !controller.isLoading.value ?
      ElevatedButton(
        key: const Key('loginForm_continue_raisedButton'),
        onPressed: () { controller.submitLogin();},
        child: const Text('Login'),
      ) : 
      Center(child: CircularProgressIndicator()),
    );
  }
}