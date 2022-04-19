import 'dart:convert';

import 'package:academy_shell/constants/api_endpoints.dart';
import 'package:academy_shell/core/base_client.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  registerAUser(String email, String password) async {
    final http.Response response =
        await AcademyBaseClient().getRequest(ApiEndpoints.fetchAcademyUsers);
    return jsonDecode(response.body);
  }
}
