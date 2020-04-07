import 'package:flutter/material.dart';
import './gradientmenu.dart';
import './player.dart';
import './sec.dart';
import 'dart:io';
import './albumart.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './audioplayerdata.dart';
import 'package:audio_manager/audio_manager.dart';
import 'package:path_provider/path_provider.dart';

class QueueView extends StatefulWidget {
  @override
  _QueueViewState createState() => _QueueViewState();
}

class _QueueViewState extends State<QueueView> {
  bool openMenu = false;
  final europeanCountries = [
    'Albania',
    'Andorra',
    'Armenia',
    'Austria',
    'Azerbaijan',
    'Belarus',
    'Belgium',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Croatia',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Estonia',
    'Finland',
    'France',
    'Georgia',
    'Germany',
    'Greece',
    'Hungary',
    'Iceland',
    'Ireland',
    'Italy',
    'Kazakhstan',
    'Kosovo',
    'Latvia',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macedonia',
    'Malta',
    'Moldova',
    'Monaco',
    'Montenegro',
    'Netherlands',
    'Norway',
    'Poland',
    'Portugal',
    'Romania',
    'Russia',
    'San Marino',
    'Serbia',
    'Slovakia',
    'Slovenia',
    'Spain',
    'Sweden',
    'Switzerland',
    'Turkey',
    'Ukraine',
    'United Kingdom',
    'Vatican City'
  ];
  void handleMenu() {
    this.setState(() {
      openMenu = openMenu ? false : true;
    });
  }

  bool isLiked = AudioData.getIsLiked;
  String shuffleMode = AudioData.getShuffleMode; // on, off
  String repeatMode = AudioData.getRepeatMode; // on, off, one
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

  // @override
  // void dispose() {
  //   AudioManager.instance.stop();
  //   super.dispose();
  // }

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
          return Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  // * Background Gradient
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(247, 51, 57, 62),
                      Color.fromARGB(255, 28, 30, 34)
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 0,
                        child: Container(
                          // * Song Name and Artist Name
                          child: Column(
                            children: <Widget>[
                              Text(''),
                              Text(
                                'End of Time',
                                style: TextStyle(
                                  fontFamily: 'Proxima Nova',
                                  color: Color.fromARGB(255, 167, 168, 170),
                                  fontSize: 18,
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
                      ),
                      Expanded(
                        flex: 3,
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
                                      FontAwesomeIcons.solidHeart,
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
                                        heroTag: null,
                                        foregroundColor: Colors.transparent,
                                        backgroundColor: Colors.transparent,
                                        splashColor:
                                            Color.fromARGB(50, 0, 0, 0),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // GestureDetector(
                                //   onTap: () async {
                                //     bool playing =
                                //         await AudioManager.instance.playOrPause();
                                //     print("await -- $playing");
                                //     HapticFeedback.vibrate();
                                //     setState(
                                //       () {
                                //         isPlayed = !isPlayed;
                                //       },
                                //     );
                                //   },
                                //   onDoubleTap: () {
                                //     setState(() {
                                //       isLiked = !isLiked;
                                //     });
                                //     flareControls.play("like");
                                //     HapticFeedback.vibrate();
                                //     isLiked
                                //         ? Scaffold.of(context)
                                //             .showSnackBar(dislikeSnackBar)
                                //         : Scaffold.of(context)
                                //             .showSnackBar(likeSnackBar);
                                //   },
                                // child:
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Container(
                                      // * Album Art
                                      width: constraints.maxWidth * 0.43,
                                      height: constraints.maxWidth * 0.43,
                                      child: AlbumArt(),
                                    ),
                                    SizedBox(
                                      // // TODO fix height and width of the image to scale
                                      height: constraints.maxWidth * 0.4,
                                      width: constraints.maxWidth * 0.4,
                                      // // TODO fix this padding to work with diff screen sizes
                                      child: CircleAvatar(
                                        // * Album Art Image
                                        backgroundColor:
                                            Color.fromARGB(51, 20, 20, 20),
                                        backgroundImage: AssetImage(
                                            AudioManager.instance.info.coverUrl),
                                      ),
                                    ),
                                  ],
                                ),
                                // ),
                              ],
                            ),
                            Container(
                              // * Back Button
                              width: constraints.maxWidth * 0.121,
                              child: Stack(
                                children: <Widget>[
                                  SecButton(),
                                  Center(
                                    child: Icon(
                                      Icons.menu,
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
                                        heroTag: null,
                                        foregroundColor: Colors.transparent,
                                        backgroundColor: Colors.transparent,
                                        splashColor:
                                            Color.fromARGB(50, 0, 0, 0),
                                        focusColor: Color.fromARGB(50, 0, 0, 0),
                                        elevation: 0,
                                        hoverElevation: 0,
                                        hoverColor: Colors.transparent,
                                        highlightElevation: 0,
                                        disabledElevation: 0,
                                        onPressed: () {
                                          HapticFeedback.vibrate();
                                          handleMenu();
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
                          flex: 6,
                          child: ListView.builder(
                              itemCount: europeanCountries.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return PlayerPage();
                                          },
                                        ),
                                      );
                                    },
                                    trailing: Container(
                                      // * Back Button
                                      width: constraints.maxWidth * 0.121,
                                      child: Stack(
                                        children: <Widget>[
                                          SecButton(),
                                          Center(
                                            child: Icon(
                                              Icons.play_arrow,
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
                                                heroTag: "play$index",
                                                foregroundColor:
                                                    Colors.transparent,
                                                backgroundColor:
                                                    Colors.transparent,
                                                splashColor:
                                                    Color.fromARGB(50, 0, 0, 0),
                                                focusColor:
                                                    Color.fromARGB(50, 0, 0, 0),
                                                elevation: 0,
                                                hoverElevation: 0,
                                                hoverColor: Colors.transparent,
                                                highlightElevation: 0,
                                                disabledElevation: 0,
                                                onPressed: () {
                                                  HapticFeedback.vibrate();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return PlayerPage();
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    title: Text(
                                      europeanCountries[index],
                                      style:
                                          TextStyle(fontFamily: "Proxima Nova"),
                                    ),
                                    subtitle: Text(europeanCountries[index]),
                                  ),
                                );
                              }))
                    ],
                  ),
                ),
              ),
              openMenu ? GradientMenu(handleMenu: handleMenu) : Container(),
            ],
          );
        },
      ),
    );
  }
}
