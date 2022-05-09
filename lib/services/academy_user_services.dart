import 'dart:convert';

import 'package:academy_shell/models/academy_user_model.dart';
import 'package:academy_shell/services/get_header.dart';
import 'package:http/http.dart' as http;

var post = 'http://dev-system.academyshell.com/api/v1/academy/academy_users';

var urlget =
    'http://dev-system.academyshell.com/api/v1/academy/academy_users?page=1&rowsPerPage=25&sortBy=id&descending=false&query=&filters={}';

class AcademyUserServices {
  Future<List<AcademyUserData>?> getAcademyUsers() async {
    var client = http.Client();

    var uri = Uri.parse(urlget);
    var response = await client.get(uri, headers: getHeader());

    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = response.body;
      var bodydata = jsonDecode(json) as Map<String, dynamic>;
      var data = bodydata["data"];
      List<AcademyUserData> list = [];
      data.forEach((element) {
        list.add(AcademyUserData.fromJson(element));
      });
      return list;
    } else {
      return [];
    }
  }
}
