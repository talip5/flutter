import 'package:flutter/material.dart';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Tutorial',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter TextField Clear and Set Value'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = new TextEditingController();
  String baslik="başlık";
  String x5="";
  @override
  Widget build(BuildContext context) {
    //_textController.text = 'Hello Flutter35'; //Set value
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body:Column(children: [
          Text("data-start",style: TextStyle(fontSize: 20),),
          Center(child:TextField(
            controller: _textController,
            autofocus: true,
            onEditingComplete: (){
              print("textfield alanına giriş sonlandı.");
            },
            onTap: (){
              print("textfield alanına girildi.");
            },
            onChanged: (String value){
              print(value);
            },
            decoration: InputDecoration(
              hintText: "Username",
            ),
          )),
          Text(baslik,style: TextStyle(fontSize: 20),),
          RaisedButton(
            onPressed: () {
              setState(() {
                baslik="Enabled";
              });
            },
            child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 10),
          RaisedButton(
            onPressed: () {
              setState(() {
                x5=_textController.text;
                print(x5);
                x5="yeni";
                print(x5);
                _textController.text="bbbbbb";
              });
            },
            child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
          ),
          Text(x5,style: TextStyle(fontSize: 20),),
        ],)
    );
  }
}