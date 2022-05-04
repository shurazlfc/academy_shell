import 'dart:convert';

import 'package:academy_shell/models/academy_user_model.dart';
import 'package:http/http.dart' as http;

var url =
    'http://dev-system.academyshell.com/api/v1/academy/academy_users?page=1&rowsPerPage=25&sortBy=id&descending=false&query=&filters={}';

class AcademyUserServices {
  Future<List<AcademyUserData>?> getAcademyUsers() async {
    var client = http.Client();

    var uri = Uri.parse(url);
    var response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2EyZDYxNzRhMjA0M2I5Nzc0NTIyZjlhOGEwZWVjMzAyODFmNDFiNTI2N2ZkN2RjYzU3NDlkYzJhNWIwZTFjMTkwOTE5MDMwY2Q1NDA0ZmIiLCJpYXQiOjE2NTE2NjEwNTMuODk0MTMyLCJuYmYiOjE2NTE2NjEwNTMuODk0MTM2LCJleHAiOjE2ODMxOTcwNTMuODg0NTkxLCJzdWIiOiIxIiwic2NvcGVzIjpbImFjYWRlbXktdXNlciJdfQ.gSnYQGYA_WezC98hx2aRKHESRG6ZWqLOJZ1GJ-T4g71oD4-jjziiLj4vkP5fp91KOuLyMPSlTPHRqfxAeJnjWpXepgan3r4jE2Ar-3gpWE8RdQIaKWWILc9dOw8tV6fNGmNkE_QaIRl5FhMwj5mbCG6HH5ytTlRj0yn7FgJSrMfMxbo1zzcN6gahu4KMcagealscC_JsfH-SPzS7412KaN2H_kFPljd77Z28Yv8YWKDktefpDU3xMNLl1G8LufgKmdGP3uREsMZbv4aDR3DQUZWh4kRA7woLgwVbJeoKiF393-kz8mgcGrfY1fI3iCcr3-ar60kwbnDglqyMqsBuPQxOboaX_t86j_AOSWXbtAxXcGsnqvEhWyOTTbox5c4RaZ7maiD4IdzzcwGeAEQK7e25aDn-FIXYB4o-TWxmtuuKwbAv6rv_McpojOsqgWLLzWSU7ErUGubnMW6fs2oy84k3Ba1IDaQuftd0X9RRfBD6cXQnun8S4lp83QyAT-Xt-rXEAOcWOJ0f59mRh2xjvDsoXLZKc-t88hlNHT4GaJxyV4b5J4h43V6jYLDbqZpb0KJ3HBev36PQb5elxznArBF8fbyOL4fd0ANGA059jjE2odVgz13HiLIr9AeaAPPsq5Njy0kgQxGrA16L6Jl2u2kXZ2pw7fj8VDX5iZW3wjI"
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = response.body;
      var bodydata = jsonDecode(json) as Map<String, dynamic>;
      var data = bodydata["data"];
      List<AcademyUserData> list = [];
      data.forEach((element) {
        list.add(AcademyUserData.fromJson(element));
      });
      return list;
    } else {
      return [];
    }
  }
}
