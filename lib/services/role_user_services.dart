// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:academy_shell/constants/api_endpoints.dart';
import 'package:academy_shell/models/academy_user_model.dart';
import 'package:academy_shell/models/role_user_model.dart';

import 'package:academy_shell/services/controller/app_exceptiom.dart';
import 'package:academy_shell/services/get_header.dart';
import 'package:http/http.dart' as http;
// import 'package:sikdaibloc/models/post.dart';
// import 'package:sikdaibloc/services/app_exception.dart';

class UserRoleServices {
  static const timeOutDuration = 20;
  //Get

  Future getUserRoles() async {
    var uri = Uri.parse(ApiEndspoints.baseurl + ApiEndspoints.fetchUserRoles);
    var response = await http.get(uri, headers: getHeader());
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var json = response.body;
        Map<String, dynamic> bodydata = jsonDecode(json);
        var data = bodydata["data"];
        List<RoleUserModel> list = [];
        data.forEach((element) {
          list.add(RoleUserModel.fromJson(element));
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
