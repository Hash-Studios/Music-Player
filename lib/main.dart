import 'package:flutter/material.dart';
import 'package:music_player/play.dart';
import 'package:music_player/sec.dart';
import 'package:music_player/albumart.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MyApp(),
    );
  }
}

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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(247, 38, 40, 43),
                  Color.fromARGB(255, 35, 37, 39)
                ],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: constraints.maxWidth * 0.121,
                            child: SecButton(),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.121,
                          ),
                          Container(
                              child: Text(
                            'PLAYING NOW',
                            style: TextStyle(
                              fontFamily: 'Proxima Nova',
                              color: Color.fromARGB(255, 117, 119, 122),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          )),
                          Container(
                            width: constraints.maxWidth * 0.121,
                          ),
                          Container(
                            width: constraints.maxWidth * 0.121,
                            child: SecButton(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 19,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: constraints.maxWidth * 0.73,
                            child: AlbumArt(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'End of Time',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Color.fromARGB(255, 167, 168, 170),
                                    fontSize: 36,
                                  ),
                                ),
                                Text(
                                  'K-391, Alan Walker & Ahrix',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Color.fromARGB(255, 117, 119, 122),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: constraints.maxWidth * 0.194,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: constraints.maxWidth * 0.121,
                            child: SecButton(),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.121,
                            child: SecButton(),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.194,
                            child: PlayPause(),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.121,
                            child: SecButton(),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.121,
                            child: SecButton(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
