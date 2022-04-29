import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http_get/user.dart';
import 'dart:core';

void main() {
  runApp(const myHttpDemo());
}

class myHttpDemo extends StatelessWidget {
  const myHttpDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My HTTP Response",
      home: myHttp(),
    );
  }
}

class myHttp extends StatefulWidget {
  const myHttp({Key? key}) : super(key: key);

  @override
  _myHttpState createState() => _myHttpState();
}

class _myHttpState extends State<myHttp> {

  final url = "https://jsonplaceholder.typicode.com/posts";

  var psotJsonData = [];

  void getData() async{
    try{
      // final response = await http.get(Uri.parse(url));
      Response response = await Dio().get(url);
      // final jsonData = jsonDecode(response.body) as List;
      final jsonData = jsonDecode(response.data) as List;
      setState(() {
        psotJsonData = jsonData;
      });
    }

    on SocketException catch(e){
      print("No internet");
    }

    catch(e){
      print("Exception");
    }
  }

  void postData() async{
    try{
      final response = await http.post(Uri.parse(url),body: {
        "userId" : "11",
        "body" : "Dheeraj",
        "title" : "dheeraj"
      });
      print(response.body);
    }
    on SocketException catch(e){
      print("No internet");
    }

    catch(e){
      print("Exception");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postData();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP Demo"),
      ),
      body: ListView.builder(
        itemCount: psotJsonData.length,
          itemBuilder: (context,index){
            return Card(
              color: Colors.white70,
              child: Container(
                padding: EdgeInsets.all(10),
                  child: Text(
                      "Id = '${psotJsonData[index]["id"]}' \n\n "
                          "UserId = '${psotJsonData[index]["userId"]}' \n\n"
                          "Body = '${psotJsonData[index]["body"]}'"
                  )
              ),
            );
      }),
    );
  }
}

