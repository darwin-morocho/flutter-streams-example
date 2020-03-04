import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  StreamController<int> _controller = StreamController.broadcast();
  StreamSubscription<int> _subs;

  @override
  void initState() {
    super.initState();
  }

  _startSubs() {
    _subs = _controller.stream.listen((int data) {
      print("data $data");
    });
    _subs.onDone(() {
      print("on DOne stream closed");
    });
  }

  @override
  void dispose() {
    _controller.close();
    _subs?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build home");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: <Widget>[
          StreamBuilder<int>(
            builder: (_, AsyncSnapshot<int> snapshot) {
              return Text(
                snapshot.data.toString(),
              );
            },
            initialData: 0,
            stream: _controller.stream,
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            child: Text("+"),
            onPressed: () {
              _counter++;
              _controller.add(_counter);
            },
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            child: Text("start subs"),
            onPressed: () {
              _startSubs();
            },
          ),
          FlatButton(
            child: Text("pausar"),
            onPressed: () {
              _subs?.pause();
            },
          ),
          FlatButton(
            child: Text("resumir"),
            onPressed: () {
              _subs?.resume();
            },
          ),
          FlatButton(
            child: Text("cancelar"),
            onPressed: () {
              _subs?.cancel();
            },
          ),
           FlatButton(
            child: Text("cerrar stream"),
            onPressed: () {
              _controller.close();
            },
          )
        ],
      )),
    );
  }
}
