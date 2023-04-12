import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class Network {
  final String _url = 'http://192.168.59.171:8000/api/';
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // token = jsonDecode(localStorage.getString("));
  }

  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  Future<User> getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = jsonDecode(localStorage.getString('user').toString())
        as Map<String, dynamic>;

    return User.fromJson(data);
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
