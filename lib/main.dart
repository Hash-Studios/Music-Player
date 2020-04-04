import 'package:flutter/material.dart';
import 'package:music_player/player.dart';
import 'package:flutter/services.dart';

// * Main Function
void main() => runApp(App());

// * Main App Stateless Widget used for statusbar coloring
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark
      ),
      child: MyApp(),
    );
  }
}

// * Main MyApp Stateless Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
      ),
      home: PlayerPage(title: 'Music Player'),    // * Player Page Instance created
    );
  }
}