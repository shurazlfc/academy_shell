import 'package:flutter/cupertino.dart';

class ApiEndspoints {
  static const String baseurl = 'http://dev-system.academyshell.com';
  static const String fetchAcademyUser =
      '/api/v1/academy/academy_users?page=1&rowsPerPage=25&sortBy=id&descending=false&query=&filters={}';
  static const String fetchUserRoles =
      '/api/v1/academy/roles?page=1&rowsPerPage=25&sortBy=id&descending=false&query=&filters={}';
}
