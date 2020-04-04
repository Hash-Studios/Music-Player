import 'package:flutter/material.dart';
import 'package:music_player/play.dart';
import 'package:music_player/sec.dart';
import 'package:music_player/albumart.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayerPage extends StatefulWidget {
  PlayerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
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
                            child: Stack(
                              children: <Widget>[
                                SecButton(),
                                Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 18,
                                    color: Colors.white38,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: FloatingActionButton(
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      hoverElevation: 0,
                                      hoverColor: Colors.transparent,
                                      highlightElevation: 0,
                                      disabledElevation: 0,
                                      onPressed: () {
                                        HapticFeedback.vibrate();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                            child: Stack(
                              children: <Widget>[
                                SecButton(),
                                Center(
                                  child: Icon(
                                    Icons.more_vert,
                                    size: 18,
                                    color: Colors.white38,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: FloatingActionButton(
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      hoverElevation: 0,
                                      hoverColor: Colors.transparent,
                                      highlightElevation: 0,
                                      disabledElevation: 0,
                                      onPressed: () {
                                        HapticFeedback.vibrate();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                            child: Stack(
                              children: <Widget>[
                                SecButton(),
                                Center(
                                  child: Icon(
                                    Icons.repeat,
                                    size: 18,
                                    color: Colors.white38,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: FloatingActionButton(
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      hoverElevation: 0,
                                      hoverColor: Colors.transparent,
                                      highlightElevation: 0,
                                      disabledElevation: 0,
                                      onPressed: () {
                                        HapticFeedback.vibrate();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.121,
                            child: Stack(
                              children: <Widget>[
                                SecButton(),
                                Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.backward,
                                    size: 18,
                                    color: Colors.white38,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: FloatingActionButton(
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      hoverElevation: 0,
                                      hoverColor: Colors.transparent,
                                      highlightElevation: 0,
                                      disabledElevation: 0,
                                      onPressed: () {
                                        HapticFeedback.vibrate();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.194,
                            child: Stack(
                              children: <Widget>[
                                PlayPause(),
                                Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.play,
                                    size: 18,
                                    color: Colors.white70,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    child: FloatingActionButton(
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      hoverElevation: 0,
                                      hoverColor: Colors.transparent,
                                      highlightElevation: 0,
                                      disabledElevation: 0,
                                      onPressed: () {
                                        HapticFeedback.vibrate();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.121,
                            child: Stack(
                              children: <Widget>[
                                SecButton(),
                                Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.forward,
                                    size: 18,
                                    color: Colors.white38,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: FloatingActionButton(
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      hoverElevation: 0,
                                      hoverColor: Colors.transparent,
                                      highlightElevation: 0,
                                      disabledElevation: 0,
                                      onPressed: () {
                                        HapticFeedback.vibrate();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.121,
                            child: Stack(
                              children: <Widget>[
                                SecButton(),
                                Center(
                                  child: Icon(
                                    Icons.shuffle,
                                    size: 18,
                                    color: Colors.white38,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: FloatingActionButton(
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      hoverElevation: 0,
                                      hoverColor: Colors.transparent,
                                      highlightElevation: 0,
                                      disabledElevation: 0,
                                      onPressed: () {
                                        HapticFeedback.vibrate();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
