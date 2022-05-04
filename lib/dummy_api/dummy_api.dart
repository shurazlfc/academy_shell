import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dummy_api_model.dart';
class DummyApi extends StatefulWidget {
  const DummyApi({Key? key}) : super(key: key);

  @override
  _DummyApiState createState() => _DummyApiState();
}

class _DummyApiState extends State<DummyApi> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }
  final url = 'https://jsonplaceholder.typicode.com/posts';
  List<DummyApiModel> dummyapilist=[];
  fetchData()async{
    Response response = await get(Uri.parse(url));
    List listJson = jsonDecode(response.body) ;
    dummyapilist = listJson.map((e) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemCount: dummyapilist.length, itemBuilder: (ctx, index){
        return Container(
          color: Colors.red,
          child:
        );
      }),
    );
  }
}


