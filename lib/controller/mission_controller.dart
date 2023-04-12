import 'dart:async';
import 'dart:convert';
import 'package:ambulance_pro_app/models/mission.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import 'auth_controller.dart';

Future<List<Mission>> fetchAllMission() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var data = jsonDecode(localStorage.getString('user').toString())
      as Map<String, dynamic>;
  var user = User.fromJson(data).id;
  final response = await http
      .get(Uri.parse('http://192.168.59.171:8000/api/chaufmission/$user'));
  if (response.statusCode == 200) {
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Mission> missions = items.map<Mission>((json) {
      return Mission.fromJson(json);
    }).toList();
    return missions;
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<Mission>> getMission(id) async {
  final response =
      await http.get(Uri.parse('http://192.168.59.171:8000/api/mission/$id'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Mission> missions = items.map<Mission>((json) {
      return Mission.fromJson(json);
    }).toList();
    return missions;
  } else {
    throw Exception('Failed to load data');
  }
}

void updateheuredeb(id, heureDeb) async {
  final response = await http.post(
    Uri.parse("http://192.168.59.171:8000/api/updateheuredeb/$id"),
    headers: <String, String>{
      'content-type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer '
    },
    body: jsonEncode(<String, String>{
      'heureDeb': heureDeb,
    }),
  );
  if (response.statusCode == 200) {
  } else {
    print(response.body);
    throw Exception('Failed to load data');
  }
}

void updateheurefin(id, heureFin) async {
  final response = await http.put(
    Uri.parse('http://192.168.59.171:8000/api/updateheurefin/$id'),
    headers: <String, String>{
      'content-type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer '
    },
    body: jsonEncode(<String, String>{
      'heureFin': heureFin,
    }),
  );
}
