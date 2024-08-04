import 'dart:io';

// import 'package:dio_interceptor_ui/dio_interceptor_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_outlet_app/login/login.dart';
import 'package:survey_outlet_app/utils/auth/auth_manager.dart';
import 'package:survey_outlet_app/home/home.dart';

class InitView extends StatelessWidget {
  InitView({Key? key}) : super(key: key);
  final _authManager = Get.put(AuthManager());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _authManager.isLogged.value ? HomePage() : LoginPage();
    });
    // NetworkInterceptorOverlay.attachTo(context);
      // return controller.needUpdate.value ?
      //     ForceUpdateView() :
      //     _authManager.isLogged.value ? LayoutView() : LoginView();
  }

}