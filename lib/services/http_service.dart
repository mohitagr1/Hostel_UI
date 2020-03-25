import 'package:hoste_ui/models/index.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String hostelerURL = "http://192.168.43.207:9090/hosteler/get/1";
  Future<Hosteler> getHosteler() async {
    http.Response res = await http.get(hostelerURL);
    if (res.statusCode == 200) {
      return Hosteler.fromJson(json.decode(res.body));
    } else {
      throw "Can't get Hostelers.";
    }
  }
}
