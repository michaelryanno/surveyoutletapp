import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:survey_outlet_app/';
import 'package:survey_outlet_app/login/login.dart';
// import 'package:smartfren_attendance/widgets/item_widget.dart';
// import 'package:smartfren_attendance/widgets/modal_bottom_widget.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: const LoginForm(),
      ),
    );
  }
}