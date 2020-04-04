import 'package:flutter/material.dart';
import 'package:music_player/play.dart';
import 'package:music_player/sec.dart';
import 'package:music_player/albumart.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// * Main PlayerPage Stateful Widget
class PlayerPage extends StatefulWidget {
  PlayerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

// * PlayerPage Initial State
class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(                                     // * Root Container
            decoration: BoxDecoration(                          // * Background Gradient
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(247, 38, 40, 43),
                  Color.fromARGB(255, 35, 37, 39)
                ],
              ),
            ),
          // * Main SafeArea
            child: SafeArea(
              child: Center(
               // * Main Column which contains all UI elements
                child: Column(
                  children: <Widget>[
                    // * This column contains five expanded widgets
                     // * which all contain row widgets
                    Expanded(                                                   // * 1st row
                      flex: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(                                                   // * Back Button
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
                                    height: 70,                                 // TODO fix button size over different screen sizes
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
                          Container(                                                   // * Empty Container
                            width: constraints.maxWidth * 0.121,
                          ),
                          Container(                                                   // * 'PLAYING NOW' Text
                              child: Text(
                            'PLAYING NOW',
                            style: TextStyle(
                              fontFamily: 'Proxima Nova',
                              color: Color.fromARGB(255, 117, 119, 122),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          )),
                          Container(                                                   // * Empty Container
                            width: constraints.maxWidth * 0.121,
                          ),
                          Container(                                                   // * Settings Button
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
                    Expanded(                                                   // * 2nd row
                      flex: 19,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(                                                   // * Album Art
                            width: constraints.maxWidth * 0.73,
                            child: AlbumArt(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(                                                   // * 3rd row
                      flex: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(                                                   // * Song Name and Artist Name
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
                    Expanded(                                                   // * 4th row
                      flex: 7,                                                   // TODO Add seekbar widget
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: constraints.maxWidth * 0.194,
                          ),
                        ],
                      ),
                    ),
                    Expanded(                                                   // * 5th row
                      flex: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(                                                   // * Repeat Button
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
                          Container(                                                   // * Backward Button
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
                          Container(                                                   // * Play/Pause Button
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
                          Container(                                                   // * Forward Button
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
                          Container(                                                   // * Shuffle Button
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
