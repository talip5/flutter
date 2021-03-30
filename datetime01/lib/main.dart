import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var now=DateTime.now();
  var dDay = DateTime.utc(1944, 6, 6);
  static final DateTime addNow=(DateTime.now().add(Duration(hours: 3)));
  static final DateTime now1=DateTime.now();
 static final DateFormat _dateFormat=DateFormat('yyyy-MM-dd');
  var formattedDate=DateFormat('yyyy-MM-dd - kk:mm').format(addNow);
  //var formattedDate=DateFormat('yyyy-MM-dd - kk:mm').format(now1);
 final String formatted=_dateFormat.format(now1);
 final String defaultLocale=Platform.localeName;
 List<Locale> get systemLocales => window.locales;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          _incrementCounter();
          print(now);
          print(dDay);
          print(now.timeZoneName);
          print(now.timeZoneOffset);
          print(now.toLocal());
          print(now.toIso8601String());
          print(now.toUtc());
          print(formatted);
          print('Platform.localeName $defaultLocale');
          print(now.add(Duration(hours:3)));
          print(now);
          print('$systemLocales');
          print(addNow);
          print(formattedDate);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
