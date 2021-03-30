import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  Future<String> cargo() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('future');
    });
    return await rootBundle.loadString('assets/datos1.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: FutureBuilder(
            //future: rootBundle.loadString('assets/datos.txt'),
              future: cargo(),
              initialData: 'waiting',
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('ERROR : ${snapshot.error.toString()}'),
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Center(
                  child: Text(snapshot.data),
                );
              }),
        ),
    );
  }
}
