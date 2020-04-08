import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './queueview.dart';
import 'package:audio_manager/audio_manager.dart';
import './audioplayerdata.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// * Main Function
void main() => runApp(App());

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

// * Main App Stateless Widget used for statusbar coloring
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark),
      child: MyApp(),
    );
  }
}

// * Main MyApp Stateless Widget
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLiked = AudioData.getIsLiked;
  String shuffleMode = AudioData.getShuffleMode;
  String repeatMode = AudioData.getRepeatMode;
  final likeSnackBar = AudioData.getLikeSnackBar;
  final dislikeSnackBar = AudioData.getDislikeSnackBar;
  String _platformVersion = AudioData.getPlatformVersion;
  bool isPlaying = AudioData.getIsPlaying;
  Duration _duration = AudioData.getDuration;
  Duration _position = AudioData.getPosition;
  double _slider = AudioData.getSlider;
  double _sliderVolume = AudioData.getSliderVolume;
  String _error = AudioData.getError;
  num curIndex = AudioData.getCurIndex;
  PlayMode playMode = AudioData.getPlayMode;
  final list = AudioData.getList;

  @override
  void initState() {
    super.initState();

    initPlatformState();
    setupAudio();
    // loadFile();
  }

  void setupAudio() {
    List<AudioInfo> _list = [];
    list.forEach(
      (item) => _list.add(
        AudioInfo(item["url"],
            title: item["title"],
            desc: item["desc"],
            coverUrl: item["coverUrl"]),
      ),
    );
    AudioManager.instance.audioList = _list;
    AudioManager.instance.intercepter = true;
    AudioManager.instance.play(auto: false);

    AudioManager.instance.onEvents((events, args) {
      print("$events, $args");
      switch (events) {
        case AudioManagerEvents.start:
          print("start load data callback");
          _position = AudioManager.instance.position;
          _duration = AudioManager.instance.duration;
          _slider = 0;
          setState(() {});
          break;
        case AudioManagerEvents.ready:
          print("ready to play");
          _error = null;
          _sliderVolume = AudioManager.instance.volume;
          _position = AudioManager.instance.position;
          _duration = AudioManager.instance.duration;
          setState(() {});
          AudioManager.instance.seekTo(Duration(microseconds: 10));
          break;
        case AudioManagerEvents.seekComplete:
          _position = AudioManager.instance.position;
          _slider = _position.inMilliseconds / _duration.inMilliseconds;
          setState(() {});
          print("seek event is completed. position is [$args]/ms");
          break;
        case AudioManagerEvents.buffering:
          print("buffering $args");
          break;
        case AudioManagerEvents.playstatus:
          isPlaying = AudioManager.instance.isPlaying;
          setState(() {});
          break;
        case AudioManagerEvents.timeupdate:
          _position = AudioManager.instance.position;
          _slider = _position.inMilliseconds / _duration.inMilliseconds;
          setState(() {});
          AudioManager.instance.updateLrc(args["position"].toString());
          break;
        case AudioManagerEvents.error:
          _error = args;
          setState(() {});
          break;
        case AudioManagerEvents.ended:
          AudioManager.instance.next();
          break;
        case AudioManagerEvents.volumeChange:
          _sliderVolume = AudioManager.instance.volume;
          setState(() {});
          break;
        default:
          break;
      }
    });
  }

  void loadFile() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    // Please make sure the `test.mp3` exists in the document directory
    final file = File("${appDocDir.path}/test.mp3");
    AudioInfo info = AudioInfo("file://${file.path}",
        title: "file",
        desc: "local file",
        coverUrl: "https://homepages.cae.wisc.edu/~ece533/images/baboon.png");

    list.add(info.toJson());
    AudioManager.instance.audioList.add(info);
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await AudioManager.instance.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      title: 'Music Player',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
      ),
      home: QueueView(
        isLiked: isLiked,
        shuffleMode: shuffleMode,
        repeatMode: repeatMode,
        likeSnackBar: likeSnackBar,
        dislikeSnackBar: dislikeSnackBar,
        platformVersion: _platformVersion,
        isPlaying: isPlaying,
        duration: _duration,
        slider: _slider,
        sliderVolume: _sliderVolume,
        error: _error,
        curIndex: curIndex,
        playMode: playMode,
        list: list,
      ), // * Queue View Instance created
    );
  }
}
