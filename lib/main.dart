import 'package:flutter/material.dart';
import 'package:streams_example/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitPage(),
      routes: {'home': (_) => HomePage()},
    );
  }
}

class InitPage extends StatelessWidget {
  const InitPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
            child: Text("go to home"),
            color: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, 'home');
            },
          ),
        ),
      ),
    );
  }
}
