import 'dart:io';

import 'package:get/get.dart';
import 'package:survey_outlet_app/utils/auth/cache_manager.dart';
import 'package:survey_outlet_app/survey/survey.dart';

class AuthManager extends GetxController with CacheManager{
  var _surveyController = Get.put(SurveyController());
  final isLogged = false.obs;

  Future onLogin(String? userName) async {
    isLogged.value = true;
    await saveUser(userName);
  }

  void onLogout() {
    _surveyController.namaOutletController.text = "";
    _surveyController.namaPemilikOutletController.text = "";
    _surveyController.hpPemilikOutletController.text = "";
    isLogged.value = false;
    // removeToken();
  }

}