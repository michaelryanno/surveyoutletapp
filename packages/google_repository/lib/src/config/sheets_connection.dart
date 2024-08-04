// import 'dart:html';
// import 'dart:io';
import 'package:gsheets/gsheets.dart';
import 'package:google_repository/google_repository.dart';

class SheetsConnection {
  static const _credentials = r'''
  {
    "type": "service_account",
    "project_id": "survey-outlet-399004",
    "private_key_id": "448984cdca0f6c57536d3a9909e3183a0836ba09",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC6iKoQgHCAiIvG\nSUHwtvIbsyugNqVm4cJ1DHPpLHT3H7HaKTDOikG50Vb1NmELoR1IXxqfz5pt9dJu\n9svEtbJgnZ8lH7zaCQFcU5zSm8I22WPEhY/cg0yktwwaNtXhjHNBwyjHN3z45mHo\npZkvYd+008CPYHSqy3/1YAZSk2a0puNT4BI7AHc/Z2ABZwFdRBeRWWsAWr9LkoeU\nl4AdCxJkPA3SWbTfYJhp85kmoyFJq7b8l93I0ox4UjHkw3aMDdKKYhK1e/2OSknO\n9+kZ/Cis8FNAFiK/uN3RR3tLeX10GXoeDOnWDjy9JfhAe8Vi4M28zYOutpdKuU4W\np7ip1CiLAgMBAAECggEARgB0pgW1cp8LqWmjm+TkHf4S0KjBUMdHdSqrsyVSbc1Q\nrtkHbnNXMBc+JX73U2hut1KtiKzdvQdkJe1rUhKH8xcj+sga1M5NWusr7qOycmgJ\nt14SO4Rwtl3VZl8Oy/qr5FGLk5ugxD2dH7RJtQzraY6P9J6TmecNybV0GfgkMoXM\nwU/1T6W+tcHPyOBt9fq5UyUp/YNZ3ltB+YF61gZyVwpBfBalRpD7YmLeI92fRTb2\n97NoMb+qP5I9s01Ig2MKUgp2FlNrx0oGIkCUJ+ZOaVaa4bMAn92ebDMyV8tLCy9h\nlBrTSyzYK/sYbboKCQWzQTSIA1wsNljoqwwY3VVe7QKBgQDdaIPHUChMS50ryumS\nMW3Yp6G+sxlKvtoGV51DUDXFKt2nUGG0qsvPCdY8zguKt8PdQDWUV1ieYD/50l+I\n54ajNM5/ZzDyIagS49MsYlAla5lmESXYRyNkBpx3tP70xFmmSIKXP5sGX1gp/OyQ\npB9t/4q+pIYoLHMfYnrM+BJE5QKBgQDXrU5ZRnZc2NYB07KRXX2EiKZomdR0iYDJ\nwkyqq6WcG4k6MEIQ9h7Nk6gW4AYfkpsWtYacDnliNRCo+y8cUGnrFoL6KbS9ccRr\nMv+oG7OA+2RcrKRgPL2xRcr3+2gOA3KQr9nXiNQiw2GEtOAfHsI+1TAQEAV7M+Rc\nLjIIRxnQrwKBgQCsUg7WToW+s88U6W2Wsc/bosRZRs11hkrsSr6ESGZBGZbABOi2\nk4PilLZgRsFm6pWPmszYso6vXRwN1PUz+XapiYz6TZcjrJxCb3zI+4+DQFZ4wPni\ndaOO0zJuXLleSX+40pCJJSED+asFqut3u7UWiKA0tpoPpGDJWX1YD+8wHQKBgGhg\nykswa7YRhrjJoGDzkvxiOc7jq8tehIKgUwRCH9sGBIqxsjeNNWkebbnsX2pGRGJg\nJa4+3wXlUpPFRI56aFhKw8aYCo2oknui6dGM3nmssGydbMvaeZ9ifJE5DanCh154\njH/gC3JrhjV4aAMHmtBX0nPjnRN8EKd//9y7tEWnAoGBAI7Ao6JoWQ8Lo+q5ICKl\nhBeGchrhbloIh75odE66m4jsbSLsa/dppIN3cuiRLsTGXwa0Q1bS1FuAYOIGz/Er\nlJCZ7wPr92NqZARg4lLcah2iGUVGisfFYhMYPQo58ZcOl4rPhgBn32kDrZGDfGTx\nvhK4NmV/lc+svMHODoMp0OtP\n-----END PRIVATE KEY-----\n",
    "client_email": "survey-outlet@survey-outlet-399004.iam.gserviceaccount.com",
    "client_id": "111143318034893574279",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/survey-outlet%40survey-outlet-399004.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  }
  ''';
  static final _spreadsheetId = '1PqN1-hkvAl5OQ7l3GjosxFOSNuunIzJAwD-XDEik_bo';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;
  static Worksheet? _dataSheet;

  static Future init() async {
    try{
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheets(spreadsheet, title:"User");
      _dataSheet = await _getWorkSheets(spreadsheet, title:"Data");

      final firstRowUser = SheetUserFieldsModels.getFields();
      final firstRowData = SheetDataFieldsModels.getFields();
      _userSheet!.values.insertRow(1, firstRowUser);
      _dataSheet!.values.insertRow(1, firstRowData);
    }catch(e){
      print('init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheets(
    Spreadsheet spreadsheet, {
      required String title,
  }) async {
    try{
      return await spreadsheet.addWorksheet(title);
    }catch(e){
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insertUser(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  } 

  static Future<int> getRowCountUser() async {
    if(_userSheet == null) return 0;

    final lastRow = await _userSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future<Sheet?> getByIdUser(int id) async {
    if(_userSheet == null) return null;

    final json = await _userSheet!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : Sheet.fromJson(json);
  }

  static Future insertData(List<Map<String, dynamic>> rowList) async {
    print(rowList);
    if (_dataSheet == null) return null;
    _dataSheet!.values.map.appendRows(rowList);
  } 

  static Future<int> getRowCountData() async {
    if(_dataSheet == null) return 0;

    final lastRow = await _dataSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future<SheetData?> getByIdData(int id) async {
    if(_dataSheet == null) return null;

    final json = await _dataSheet!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : SheetData.fromJson(json);
  }
}