
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:survey_outlet_app/utils/auth/cache_manager.dart';
import 'package:survey_outlet_app/widgets/snackbar_widget.dart';
import 'package:google_repository/google_repository.dart';
import 'package:survey_outlet_app/utils/auth/auth_manager.dart';


class LoginController extends GetxController with CacheManager {
  final _authManager = Get.put(AuthManager());
  
  var hiddenPassword = true.obs;
  var isAuth = false.obs;
  RxBool isLoading = false.obs;
  // get from view
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void onInit() async {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose(){
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> submitLogin() async {
    // var showPackage = await getPackageInfo();
    isLoading.value = true;
    var isLogin = await checkLogin(usernameController.text,passwordController.text);
    if(isLogin){
      _authManager.onLogin(usernameController.text);
    }else{
      SnackBarWidget(title: "Error", message: "Authentication Fail", type: SnackBarType.error).show();
    }
    passwordController.text = "";
    isLoading.value = false;
  }

  Future<dynamic> checkLogin(username,password) async{
    var checkThis = false;
    try {
      // check base of google sheets
      var listAccounts = await AuthService.getAccount();
      for(var i= 0; i<listAccounts.length;i++ ){
        if(username == listAccounts[i]["nama"] && password == listAccounts[i]["password"]){
          await saveUser(listAccounts[i]["nama"]);
          checkThis = true;
          break;
        }
      };
      return checkThis;
    } catch (e) {
      return false;
      //   print('Error sending request!');
      //   print(e.message);
    }
  }

  Future<void> submitLogout() async {
    _authManager.onLogout();
  }
}