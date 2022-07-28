import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leave_management_app/helper/tempstorage.dart';

class WebClient {

  static const ip = "http://192.168.1.33:5050";


  static Future<dynamic> post(url, data) async {
    var token = await TempStorage.getToken();
    Map? sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }
    print(sendData);

    var body = json.encode(sendData);

    var response = await http.post(
      Uri.parse(ip + url),
      headers: {"Content-Type": "application/json", "token": token ?? ""},
      body: body,
    );
    print(response.body);
    print("token - " + token.toString() + " ||");
    if (response.statusCode == 200) {
      print(response.body);
      print("sss");
      return jsonDecode(response.body);
    } else {
      print("ssshhh");
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;

    }
  }

  static Future<dynamic> get(url) async {
    var token = await TempStorage.getToken();
    var response = await http.get(Uri.parse(ip + url),
        headers: {"Content-Type": "application/json", "token": token ?? ""});

    print("token - " + token.toString() + " ||");
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;
    }
  }
}