import 'dart:convert';
import 'dart:io';
import 'package:uploadfile_repository/uploadfile_repository.dart';
import 'package:http/http.dart' as http;

class UploadService {

  Future<dynamic> uploadFileToOdm(List<File> files) async {
    // var _res = {
    //   'status': false,
    //   // 'data': Map<String, dynamic>
    //   'data': List<String>.empty()
    // };
    Map<String,dynamic> _res = {
      'status': false,
      'data': ""
    };

    var _exp_resp = r'''
    {
        "status": "success",
        "msg": "upload success",
        "data": [
          {"link_view": "https://en.wikipedia.org/wiki/Golden_Gate_Bridge#/media/File:GoldenGateBridge-001.jpg"},
          {"link_view": "https://en.wikipedia.org/wiki/House#/media/File:Katsura_Imperial_Villa_in_Spring.jpg"},
          {"link_view": "https://en.wikipedia.org/wiki/Bicycle#/media/File:Left_side_of_Flying_Pigeon.jpg"}
        ]
    }
    ''';
    // ResponseUpload resp = ResponseUpload();
    // resp.code = 200;

    final jsonResponse = json.decode(_exp_resp);
    ResponseUpload resp = new ResponseUpload.fromJson(jsonResponse);
    var tmp_data = resp.data?.map( (u) => u.link_view).toString();
    int tmp_lngt = tmp_data != null ? tmp_data.length : 1;
    tmp_data = tmp_data?.substring(1,  tmp_lngt - 1);
    _res["data"] = tmp_data;
    _res["status"] = true;

    // try {
    //   var headers = {
    //     'Authorization': 'Basic ${base64Encode(utf8.encode(userBasic+':'+passBasic))}'
    //   };
    //   var request = http.MultipartRequest('POST', Uri.parse(urlServer));
    //   // request.files.add(await http.MultipartFile.fromPath('file[]', '/Users/hendrisildrian/Pictures/run 17an.jpeg'));
    //   // request.files.add(await http.MultipartFile.fromPath('file[]', '/Users/hendrisildrian/Pictures/sinarmas_value_2_new.png'));
    //   for(var i = 0; i < files.length; i++){
    //     request.files.add(await http.MultipartFile.fromPath('file[]', '${files[i].path}'));
    //   }
    //   request.headers.addAll(headers);
    //   http.StreamedResponse response = await request.send();
    //   if (response.statusCode == 200) {
    //     print(await response.stream.bytesToString());
    //     print(response);
    //     _res["status"] = true;
    //   }
    //   else {
    //     print(response.reasonPhrase);
    //     _res["status"] = true;
    //   }
    //   return _res;
    // } catch (e) {
    //   print(e);
    //   return _res;
    // }
    return _res;
  }

}