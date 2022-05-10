// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:academy_shell/constants/api_endpoints.dart';
import 'package:academy_shell/models/academy_user_model.dart';
import 'package:academy_shell/services/controller/app_exceptiom.dart';
import 'package:academy_shell/services/get_header.dart';
import 'package:http/http.dart' as http;
// import 'package:sikdaibloc/models/post.dart';
// import 'package:sikdaibloc/services/app_exception.dart';

class AcademyUserServices {
  static const timeOutDuration = 20;
  //Get

  Future<List<AcademyUserData>?> getAcademyUsers() async {
    var uri = Uri.parse(ApiEndspoints.baseurl + ApiEndspoints.fetchAcademyUser);
    var response = await http.get(uri, headers: getHeader());
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var json = response.body;
        var bodydata = jsonDecode(json) as Map<String, dynamic>;
        var data = bodydata["data"];
        List<AcademyUserData> list = [];
        data.forEach((element) {
          list.add(AcademyUserData.fromJson(element));
        });
        return list;
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API Not Responding', uri.toString());
    }
    return _processResponse(response);
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;

        break;

      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());

      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
