import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:google_repository/google_repository.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using 
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormDataConnection {
  
  // Google App Script Web URL.
  static const String URL = "https://script.google.com/macros/s/AKfycbwBkWcldlrC3bi7L1DTl04WJ3TBSbM1QR0oG_JLWGsCGhvat2d-WxSm0DWb-wLp0gFryw/exec";
  
  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
   void submitForm(
      DataForm dataForm, void Function(String) callback) async {
    try {
      await http.post(Uri.parse(URL), body: dataForm.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(Uri.parse("${url}")).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}