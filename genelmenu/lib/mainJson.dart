import 'package:flutter/material.dart';
import 'package:genelmenu/detail.dart';
import 'package:genelmenu/dosyaislemleri.dart';
import 'package:genelmenu/home.dart';
import 'package:genelmenu/setting.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await postuGetir();
}


/*
 {
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
}
*/
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

/*
Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/student.json');
}

Future loadStudent() async {
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  Map<String,dynamic> deneme=new Map();
  deneme=jsonResponse;
  print(deneme.length);
  deneme.forEach((key, value) {
    print(value);
  });
  Student student = new Student.fromJson(jsonResponse);

  print(student.studentName);
}
*/


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
}

