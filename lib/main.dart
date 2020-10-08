import 'package:flutter/material.dart';
const api = "http://127.0.0.1/json_retorno.php";

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.width;
    double largura = MediaQuery.of(context).size.height;



    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: altura/2,
            width: largura/2,

            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.supervised_user_circle),
                    labelText: 'USUARIO',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                  ),

                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.security),
                    labelText: 'SENHA',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                  ),

                ),
                RaisedButton.icon(
                  textColor: Colors.white,
                  color: Color(0xFF6200EE),
                  onPressed: () {

                  },
                  icon: Icon(Icons.add, size: 18),
                  label: Text("ENTRAR"),
                )
              ],
            ),
          ),

        ],
      )
    );
  }
}
