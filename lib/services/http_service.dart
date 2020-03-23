import 'dart:convert';

import 'package:hoste_ui/models/index.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String hostelerURL = "http://localhost:9090/hosteler/get/1";
  Future<Hosteler> getHosteler() async {
    print("I am here");
    http.Response res = await http.get(hostelerURL);
    print("No I am here");
    if (res.statusCode == 200) {
      print("OK");
      return Hosteler.fromJson(json.decode(res.body));
    } else {
      print("Not OK");
      throw "Can't get Hostelers.";
    }
  }
}
