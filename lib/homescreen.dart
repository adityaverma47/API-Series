import 'dart:convert';

import 'package:apiseries_practice1/PostModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

List<PostModel> postList =[];
Future<List<PostModel>> getPostApi() async {
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

  var data = jsonDecode(response.body.toString());

  if(response.statusCode == 200) {
    for(Map i in data) {
      postList.add(PostModel.fromJson(i));
    }

    return postList;
  }else{
    return postList;
  }


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Api Course"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getPostApi(),
            builder: (context, snapshot){
              if(!snapshot.hasData) {
                return Text("loading");
        } else{
                return ListView.builder(
                  itemCount: postList.length,
                itemBuilder: (context, index){
                  return Text(index.toString());
        });
        }
        } ),
      ),
    );
  }
}
