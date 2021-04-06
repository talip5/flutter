import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detail Page"),
        ),
        body: ElevatedButton(
          child: Text('Home Page',style: TextStyle(fontSize: 25.0),),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
