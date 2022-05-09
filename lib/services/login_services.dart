// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:academy_shell/constants/app_constants.dart';
import 'package:academy_shell/injector.dart';
import 'package:academy_shell/pages/views/main_screen.dart';
import 'package:academy_shell/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login {
 Future<LoginResponse?> fetchlogin(String username, String password, context) async {
    http.Response? response = await http.post(Uri.parse('http://dev-system.academyshell.com/api/academy-user/login'), 
    headers: {  
      "Content-Type": "application/json", 
      "Accept": "application/json",

    }
    body: jsonEncode(
       {
      "username": username,
      "password": password
    }
    )
    
    );
    if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {
      var bodyData = jsonDecode(response.body);
      
      var loginData = LoginResponse.fromJson(bodyData);
      locator<SharedPreferences>().setString(AppConstants.AccessToken, loginData.token!);

    return loginData;
  //  Ncell@1558
     
    }else{
      // ignore: prefer_const_constructors
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid username or password")));
      return null;
    }
  

      // Navigator.pushNamed(context, MainScreen.routeName);

  } 
  
}

