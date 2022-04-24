import 'dart:convert';

import 'package:academy_shell/constants/api_endpoints.dart';
import 'package:academy_shell/core/base_client.dart';
import 'package:academy_shell/pages/academy_management_pages/academy_users.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  registerAUser(String email, String password) async {
    final http.Response response =
        await AcademyBaseClient().getRequest(ApiEndpoints.fetchAcademyUsers);
    return jsonDecode(response.body);
  }
}

Future<List<Name>> fetchNames() async {
  try {
    final response = await http.get(Uri.parse(
        'http://dev-system.academyshell.com/api/v1/academy/academy_users?page=1&rowsPerPage=25&sortBy=id&descending=false&query=&filters={}'));
    if (response.statusCode == 200) {
      var bodyData = jsonDecode(response.body);
      return [];
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}
