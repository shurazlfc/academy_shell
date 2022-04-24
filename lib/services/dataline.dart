import 'dart:convert';
import 'package:academy_shell/constants/api_endpoints.dart';
import 'package:academy_shell/services/AcademyUserdata_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AcademyUserServices {
  Future<List<AcademyUserData>?> fetchAcademyData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString("token") ?? "";
    var headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    http.Response response = await http.get(
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.fetchAcademyUsers),
        headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      print(response);
      var bodyData = jsonDecode(response.body) as Map<String, dynamic>;
      List<AcademyUserData> data = [];
      data = bodyData["data"].map<AcademyUserData>((e) {
        return AcademyUserData.fromJson(e);
      }).toList();
      print(data);
      return data;
      // AcademyUserData savedAcademy = AcademyUserData.fromJson(bodyData);
      // return savedAcademy;
    } else {
      return [];
    }
  }
}
