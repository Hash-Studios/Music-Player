import 'package:flutter/material.dart';
import 'package:music_player/play.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
          brightness: Brightness.dark, primarySwatch: Colors.deepOrange),
      home: MyHomePage(title: 'Music Player'),
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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            child: PlayPause(),
            ),
        ),
        ),
    );
  }
}
