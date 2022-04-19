// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:academy_shell/pages/bottomnavigationpages/MainScreen.dart';
import 'package:academy_shell/services/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login {
  fetchlogin(String username, String password, context) async {
    http.Response? response = await http.post(Uri.parse('http://dev-system.academyshell.com/api/academy-user/login'), 
    headers: {  
      "Content-Type": "application/json", 
      "Accept": "application/json",
      // "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMDU2ZDZmMDYxMjQ4ZjlkNjNhNmVlN2U5ODQ4N2Y4Y2MwMjU4ODI4ODY2M2Q5NDc3MzFhMWIwMThhMjIyZjNlZGI5NmY4Y2I0ZGNmZmRjMmMiLCJpYXQiOjE2NTAxNzMwNzIuNjM5Njk5LCJuYmYiOjE2NTAxNzMwNzIuNjM5NzAyLCJleHAiOjE2ODE3MDkwNzIuNjMwODk3LCJzdWIiOiIxIiwic2NvcGVzIjpbImFjYWRlbXktdXNlciJdfQ.QXO5LkgS1Cwc-wQDdO73Aol2ZlftQ8LbiBdcfnrJ64HU4yPyH92C5EInCf7BzSAorGQrlLbpuapNCOWq4AdSqh9ZcfZndryxyD8Myhve8LH1JoCv0DToS8ccVey8MM4zPIFod69UdKdBHeensYYuuNB6dMnP6558U4J1cob4GVNqmOw8BYcoXFJSLuVLknM6EKJXYxXwyUTz_BWxwpLCWpJoJcR_8hj2JnICikZJOrC-ylQmp1mjC7OBBM9bWEUC2kAkP9nPEqIjIM_t_7sFCn3Xnr-JskXzCCyNkCMAG9mr9qZEvmR4K4k6qkt_DjB8vmMoxNzjhv8tbpRsNw4vnLbHarjYvBxli80FXKTMpshFwxANBqSxG6u8K8UoPCwlYGLZn9RqzMg-dgmHGxjC_0kR2_Hnr9msNKOsyeg7oyE74lEKD_Fgu55w7IMf-WF_jcbpPlWLSEiVL_TUSxsqh_arrN1IpUB16hgsYsGGqhV7o-aL_1BCEuUfeZ1noAnxkQSnfDkrMeYnVjx0k9hsC9pBUf5sLtbL7ZwugS4v-Zkw-5TdwmlEQPCg3Qb3gTYXDBs6Z9dq6dnfisSKQwlrdumV8LJ7-bR-YKNroGTkG8CM3Za6OBBuFk4v7pEP5_-hMNx9QqwwtW9-JPRr65qAosCzXPyIkpuXWBZDhMQcwsc" 
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
    
    

      Navigator.pushNamed(context, MainScreen.routeName);
  //  Ncell@1558
     
    }else{
      // ignore: prefer_const_constructors
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid username or password")));
    }
  

      // Navigator.pushNamed(context, MainScreen.routeName);

  } 
  
}
