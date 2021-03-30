import 'package:flutter/material.dart';

void main(){
  var details={'username':'tom', 'age':25};
  var details1=new Map();
  details1['username1']='admin';
  details1['password']='admin@123';
  print(details);
  print(details1);
  print(details.length);
  print(details.keys);
  print(details.isEmpty);
  print(details.values);
  print(details.entries);
  print(details.runtimeType);
  //details.clear();
  details.update('username', (dynamic value) => value='ayşe');
  print(details.values);
  details.update("age", (dynamic val) => ++val); // => 26
  print(details.values);
  details.update("age", (dynamic val) => val=35); // => 26
  print(details.values);
  details['Uid']='a123';
  print(details.values);

}
