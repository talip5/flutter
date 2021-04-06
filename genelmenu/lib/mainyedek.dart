import 'package:flutter/material.dart';
import 'package:genelmenu/detail.dart';
import 'package:genelmenu/dosyaislemleri.dart';
import 'package:genelmenu/home.dart';
import 'package:genelmenu/jsonkonusu.dart';
import 'package:genelmenu/setting.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
      "/detail":(context)=>Detail(),
      "/setting":(context)=>Setting(),
      "/dosyaislemleri":(context)=>Dosyaislemleri(kayitislemi: kayitislemleri(),),
      "/jsonKonusu":(context)=>JsonKonusu(),

    },
  ));
}

