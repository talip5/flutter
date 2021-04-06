import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http; ;

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

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();


  String url ="https://httpget-183fc-default-rtdb.firebaseio.com/userprofile.json";
  http.post(url,body:json.encode());
  sendData() {
    http.post("https://httpget-183fc-default-rtdb.firebaseio.com/userprofil.json",
        body: json.encode({
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'email': emailController.text,
        }));
    setState(() {
      userProfile.add(Profile(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
      ));
    });
  }


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
            TextField(
              controller: firstNameController,
              decoration:InputDecoration(labelText:'FirstName'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText:'LastName'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'email'),
            ),
            FlatButton(
              child: Text("Send"),
              color: Colors.indigo,
              onPressed: sendData,
            ),
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Profile extends StatelessWidget {
  String firstName;
  String lastName;
  String email;
  String phoneNo;

  Profile({
    @required this.email,
    @required this.lastName,
    @required this.firstName,
  });
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orangeAccent,
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
              "${firstName.substring(0, 1).toUpperCase()} ${lastName.substring(0, 1).toUpperCase()}"),
        ),
        title: Text(
          "${firstName} ${lastName}",
        ),
        subtitle: Text("$email"),
      ),
    );
  }
}