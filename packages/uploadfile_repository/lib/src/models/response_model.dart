class ResponseUpload {
  // final int? code;
  final String? status;
  final String? msg;
  final List<Data>? data;

  // ResponseUpload({this.status, this.code, this.data});
  ResponseUpload({this.status, this.msg, this.data});

  factory ResponseUpload.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['data'] as List;
    // print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();


    return ResponseUpload(
        status: parsedJson['status']!,
        msg: parsedJson['msg']!,
        // code: parsedJson['code']!,
        data: dataList
    );
  }
}

class Data {
  final String? link_view;

  Data({this.link_view});

  factory Data.fromJson(Map<String, dynamic> parsedJson){
      return Data(
          link_view:parsedJson['link_view']!
      );
  }
}