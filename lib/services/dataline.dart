import 'dart:convert';
import 'package:academy_shell/constants/api_endpoints.dart';
import 'package:academy_shell/services/AcademyUserdata_response.dart';
import 'package:http/http.dart' as http;

class AcademyUserServices {
  Future<AcademyUserData?> fetchAcademyData() async {
    http.Response response = await http.get(
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.fetchAcademyUsers),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json"
        });
    print(response.statusCode);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      print(response);
      var bodyData = jsonDecode(response.body);
      AcademyUserData savedAcademy = AcademyUserData.fromJson(bodyData);
      return savedAcademy;
    } else {
      return null;
    }
  }
}
