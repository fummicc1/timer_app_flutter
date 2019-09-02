import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text("タイマーアプリ")),
          body: TimerPage(),
        ));
  }
}

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _time = 0;
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Spacer(),
            Text(
              _time.toString(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            Row(
              children: <Widget>[
                Spacer(),
                FlatButton(
                    child: Text("Stop"),
                    color: Colors.red,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    onPressed: () {
                      setState(() {
                        _time = 0;
                      });
                      _timer.cancel();
                    }),
                SizedBox(width: 64),
                FlatButton(
                  child: Text("Start"),
                  color: Colors.orange,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16)),
                  onPressed: () {
                    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                      setState(() {
                        _time += 1;
                      });
                    });
                  },
                ),
                Spacer()
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
