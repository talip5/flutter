import 'dart:async' show Future;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'student_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await loadStudent();
}



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
    print (jsonString);
    print(jsonResponse);
    print(student.studentScores);
    print(student.studentId);
    print(student.studentName);
  }
