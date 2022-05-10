import 'dart:convert';

import 'package:academy_shell/services/get_header.dart';
import 'package:http/http.dart' as http;

import '../models/academy_permission_model.dart';

class AcademyPermissionServices{
  var urlGet = 'http://dev-system.academyshell.com/api/v1/academy/permissions?page=1&rowsPerPage=25&sortBy=id&descending=false&query=&filters={}';
  Future<List<AcademyPermissionModel>>getAcademyPermission()async{
    var client = http.Client();
    var uri = Uri.parse(urlGet);
    var response = await client.get(uri,headers: getHeader());
    if(response.statusCode==200 || response.statusCode ==201){
      var json = response.body;
      var bodyData = jsonDecode(json) as Map<String, dynamic>;
      var data = bodyData["data"];
      List<AcademyPermissionModel> list = [];
      data.forEach((element){
        list.add(AcademyPermissionModel.fromJson(element));
      });
      return list;
    }else{
      return [];
    }

  }
}