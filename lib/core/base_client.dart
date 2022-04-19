import 'package:academy_shell/constants/api_endpoints.dart';
import 'package:http/http.dart' as http;

class AcademyBaseClient {
  Future getRequest(String path,
      {String baseUrl = ApiEndpoints.baseUrl}) async {
    http.Response? response;
    response = await http.get(
      Uri.parse(baseUrl + path),
      headers: {},
    );
    return response;
  }

  Future postRequest(
    String path,
    Map<String, dynamic> body,
  ) async {
    http.Response? response;
    response = await http.post(Uri.parse(path),
        headers: {
          "Authorization": "Bearer {token}",
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: body);
    return response;
  }
}
