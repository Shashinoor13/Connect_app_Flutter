import 'dart:convert';
import 'package:fitness2/screens/info.dart';
import 'package:http/http.dart' as http;

class InformationAPI {
  static Future<List<Information>?> getInfo() async {
    var uri = Uri.https('randomuser.me', '/api/');
    final response = await http.get(uri);
    Map data = jsonDecode(response.body);
    List temp = [];
    for (var i = 0; i < 10; i++) {
      temp.add(data);
    }
    return Information.informationFromSnapshot(temp);
  }
}
