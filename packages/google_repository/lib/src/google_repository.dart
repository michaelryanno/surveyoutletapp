// import 'dart:io';
import 'package:google_repository/google_repository.dart';

import 'dart:convert';

class AuthService {
  static Future getAccount() async {
    final sheet = await SheetsConnection.getByIdUser(1);
    var mapSheet = sheet!.toJson();
    var stringAccounts = mapSheet["accounts"];
    var listAccounts = json.decode(stringAccounts).cast<dynamic>().toList();
    return listAccounts;
  }

  static Future<bool> postData(data) async {
    final sheetData = await SheetsConnection.insertData(data);
    // return sheetData;
    return true;
  }
}