import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

mixin CacheManager {

  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.token.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.token.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.token.toString());
  }

  Future<bool> saveUser(String? user) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.user.toString(), user.toString());
    return true;
  }

  String? getUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.user.toString());
  }

  Future<void> removeUser() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.user.toString());
  }

  Future<bool> saveCurPosition(Map<String, dynamic>? curposition) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.curposition.toString(), curposition);
    return true;
  }

  Map<String, dynamic>? getCurPosition() {
    final box = GetStorage();
    return box.read(CacheManagerKey.curposition.toString());
  }

  Future<dynamic> getPackageInfo() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    var rs = "appname: ${appName}\n packageName: ${packageName}\n version: ${version}\n buildNumber: ${buildNumber}";
    return rs;
  }

  // Future<bool> saveBiometric(bool biometric) async {
  //   final box = GetStorage();
  //   await box.write(CacheManagerKey.biometric.toString(), biometric);
  //   return true;
  // }

  // bool? getBiometric() {
  //   final box = GetStorage();
  //   return box.read(CacheManagerKey.biometric.toString());
  // }

  // Future<void> removeBiometric() async {
  //   final box = GetStorage();
  //   await box.remove(CacheManagerKey.biometric.toString());
  // }

  // Future<bool> saveAuthentication(Map<String, dynamic>? authenticate) async {
  //   final box = GetStorage();
  //   await box.write(CacheManagerKey.authenticate.toString(), authenticate);
  //   return true;
  // }

  // Map<String, dynamic>? getAuthenticate() {
  //   final box = GetStorage();
  //   return box.read(CacheManagerKey.authenticate.toString());
  // }

  // Future<void> removeAuthenticate() async {
  //   final box = GetStorage();
  //   await box.remove(CacheManagerKey.authenticate.toString());
  // }

}

// enum CacheManagerKey { token, user, biometric, authenticate }
enum CacheManagerKey { token, user,  curposition}