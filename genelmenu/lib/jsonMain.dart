import 'package:flutter/material.dart';
import 'package:genelmenu/detail.dart';
import 'package:genelmenu/dosyaislemleri.dart';
import 'package:genelmenu/home.dart';
import 'package:genelmenu/setting.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JsonMain extends StatefulWidget{

  @override
  _JsonMainState createState() => _JsonMainState();
}

class _JsonMainState extends State<JsonMain> {

  String title='jsonMain 35';

  Future<Post> postuGetir() async {
    final cevap = await http.get(Uri.https('jsonplaceholder.typicode.com','posts/1'));

    final jsonResponse = json.decode(cevap.body);
    Map<String,dynamic> deneme=new Map();
    deneme=jsonResponse;
    print(deneme.length);
    deneme.forEach((key, value) {
      print(value);
    });
    Post post=new Post.fromJson(json.decode(cevap.body));
    print(post.id);
    print (post.title);
    print(cevap.statusCode);
    if(cevap.statusCode==200){
      print(cevap.statusCode);
    }
    setState(() {
      title=post.id.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp (
     home: Scaffold(
       appBar: AppBar(
         title: Text("jsonMain"),
       ),
         body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(title,style: TextStyle(fontSize: 25.0),),
             ElevatedButton(
               child: Text('Postu getir',style: TextStyle(fontSize: 25.0),),
               onPressed: (){
                 postuGetir();
               },
             ),

             ElevatedButton(
               child: Text('Home Page',style: TextStyle(fontSize: 25.0),),
               onPressed: (){
                 Navigator.pop(context);
               },
             ),

           ],
         ),
     ),
   );
  }
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}



