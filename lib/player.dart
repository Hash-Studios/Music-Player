import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:music_player/play.dart';
import 'package:music_player/sec.dart';
import 'package:music_player/albumart.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:audio_manager/audio_manager.dart';
import 'package:path_provider/path_provider.dart';
import './slider_thumb.dart';
import './slider_track.dart';

// * Main PlayerPage Stateful Widget
class PlayerPage extends StatefulWidget {
  PlayerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

// * PlayerPage Initial State
class _PlayerPageState extends State<PlayerPage> {
  final FlareControls flareControls = FlareControls();
  bool isLiked = false;
  bool isPlayed = false;
  String shuffleMode = 'off'; // on, off
  String repeatMode = 'off'; // on, off, one
  final likeSnackBar = SnackBar(
    content: Text('Yay! Added to favourites!'),
    backgroundColor: Colors.white24,
    duration: Duration(milliseconds: 500),
    elevation: 10,
  );
  final dislikeSnackBar = SnackBar(
    content: Text('Removed from favourites!'),
    backgroundColor: Colors.white24,
    duration: Duration(milliseconds: 500),
    elevation: 10,
  );

  String _platformVersion = 'Unknown';
  bool isPlaying = false;
  Duration _duration;
  Duration _position;
  double _slider;
  double _sliderVolume;
  String _error;
  num curIndex = 0;
  PlayMode playMode = AudioManager.instance.playMode;

  final list = [
    {
      "title": "End of Time",
      "desc": "K-391, Alan Walker & Ahrix",
      "url": "assets/audio.mp3",
      "coverUrl": "assets/album_art.png"
    },
  ];

  @override
  void initState() {
    super.initState();

    initPlatformState();
    setupAudio();
    // loadFile();
  }

  @override
  void dispose() {
    AudioManager.instance.stop();
    super.dispose();
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
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            // * Root Container
            decoration: BoxDecoration(
              // * Background Gradient
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
                    Expanded(
                      // * 1st row
                      flex: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            // * Back Button
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
                                    height:
                                        70, // TODO fix button size over different screen sizes
                                    width: 70,
                                    child: FloatingActionButton(
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      splashColor: Color.fromARGB(50, 0, 0, 0),
                                      focusColor: Color.fromARGB(50, 0, 0, 0),
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
                            // * Empty Container
                            width: constraints.maxWidth * 0.121,
                          ),
                          Container(
                              // * 'PLAYING NOW' Text
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
                            // * Empty Container
                            width: constraints.maxWidth * 0.121,
                          ),
                          Container(
                            // * Settings Button
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
                                      splashColor: Color.fromARGB(50, 0, 0, 0),
                                      focusColor: Color.fromARGB(50, 0, 0, 0),
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
                      // * 2nd row
                      flex: 23,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              HapticFeedback.vibrate();
                              setState(
                                () {
                                  isPlayed = !isPlayed;
                                },
                              );
                            },
                            onDoubleTap: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                              flareControls.play("like");
                              HapticFeedback.vibrate();
                              isLiked
                                  ? Scaffold.of(context)
                                      .showSnackBar(dislikeSnackBar)
                                  : Scaffold.of(context)
                                      .showSnackBar(likeSnackBar);
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  // * Album Art
                                  width: constraints.maxWidth * 0.83,
                                  height: constraints.maxWidth * 0.83,
                                  child: AlbumArt(),
                                ),
                                Container(
                                  width: constraints.maxWidth * 0.83,
                                  child: Center(
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: FlareActor(
                                        'assets/like.flr',
                                        controller: flareControls,
                                        animation: 'idle',
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      // * 3rd row
                      flex: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            // * Song Name and Artist Name
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(''),
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
                      // * 4th row
                      flex: 7, // TODO Add seekbar widget
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 400,
                            child: songProgress(context),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      // * 5th row
                      flex: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            // * Repeat Button
                            width: constraints.maxWidth * 0.121,
                            child: Stack(
                              children: <Widget>[
                                SecButton(),
                                Center(
                                  child: Icon(
                                    repeatMode != 'one'
                                        ? Icons.repeat
                                        : Icons.repeat_one,
                                    size: 18,
                                    color: repeatMode != 'off'
                                        ? Colors.deepOrange[400]
                                        : Colors.white38,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: FloatingActionButton(
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      splashColor: Color.fromARGB(50, 0, 0, 0),
                                      focusColor: Color.fromARGB(50, 0, 0, 0),
                                      elevation: 0,
                                      hoverElevation: 0,
                                      hoverColor: Colors.transparent,
                                      highlightElevation: 0,
                                      disabledElevation: 0,
                                      onPressed: () {
                                        HapticFeedback.vibrate();
                                        setState(() {
                                          repeatMode == 'on'
                                              ? repeatMode = 'one'
                                              : repeatMode == 'one'
                                                  ? repeatMode = 'off'
                                                  : repeatMode = 'on';
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // * Backward Button
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
                                      splashColor: Color.fromARGB(50, 0, 0, 0),
                                      focusColor: Color.fromARGB(50, 0, 0, 0),
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
                            // * Play/Pause Button
                            width: constraints.maxWidth * 0.194,
                            child: Stack(
                              children: <Widget>[
                                PlayPause(),
                                Center(
                                  child: FaIcon(
                                    isPlayed
                                        ? FontAwesomeIcons.pause
                                        : FontAwesomeIcons.play,
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
                                      onPressed: () async {
                                        bool playing = await AudioManager
                                            .instance
                                            .playOrPause();
                                        print("await -- $playing");
                                        HapticFeedback.vibrate();
                                        setState(() {
                                          isPlayed = !isPlayed;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // * Forward Button
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
                                      splashColor: Color.fromARGB(50, 0, 0, 0),
                                      focusColor: Color.fromARGB(50, 0, 0, 0),
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
                            // * Shuffle Button
                            width: constraints.maxWidth * 0.121,
                            child: Stack(
                              children: <Widget>[
                                SecButton(),
                                Center(
                                  child: Icon(
                                    Icons.shuffle,
                                    size: 18,
                                    color: shuffleMode == 'on'
                                        ? Colors.deepOrange[400]
                                        : Colors.white38,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: FloatingActionButton(
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      splashColor: Color.fromARGB(50, 0, 0, 0),
                                      focusColor: Color.fromARGB(50, 0, 0, 0),
                                      elevation: 0,
                                      hoverElevation: 0,
                                      hoverColor: Colors.transparent,
                                      highlightElevation: 0,
                                      disabledElevation: 0,
                                      onPressed: () {
                                        HapticFeedback.vibrate();
                                        setState(() {
                                          shuffleMode == 'on'
                                              ? shuffleMode = 'off'
                                              : shuffleMode = 'on';
                                        });
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
                      flex: 3,
                      child: Text(''),
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

  Widget songProgress(BuildContext context) {
    var style = TextStyle(color: Colors.deepOrange);
    return Row(
      children: <Widget>[
        Text(
          _formatDuration(_position),
          style: style,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape: RetroSliderTrackShape(),
                  trackHeight: 5,
                  activeTrackColor: Color.fromARGB(255, 234, 93, 29),
                  inactiveTrackColor: Color.fromARGB(255, 170, 141, 30),
                  thumbShape: RetroSliderThumbShape(thumbRadius: 8),
                ),
                child: Slider(
                  value: _slider ?? 0,
                  onChanged: (value) {
                    setState(() {
                      _slider = value;
                    });
                  },
                  onChangeEnd: (value) {
                    if (_duration != null) {
                      Duration msec = Duration(
                          milliseconds:
                              (_duration.inMilliseconds * value).round());
                      AudioManager.instance.seekTo(msec);
                    }
                  },
                )),
          ),
        ),
        Text(
          _formatDuration(_duration),
          style: style,
        ),
      ],
    );
  }

  String _formatDuration(Duration d) {
    if (d == null) return "--:--";
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    String format = ((minute < 10) ? "0$minute" : "$minute") +
        ":" +
        ((second < 10) ? "0$second" : "$second");
    return format;
  }
}
