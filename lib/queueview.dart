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
  bool isLiked;
  String shuffleMode;
  String repeatMode;
  var likeSnackBar;
  var dislikeSnackBar;
  String platformVersion;
  bool isPlaying;
  Duration duration;
  Duration position;
  double slider;
  double sliderVolume;
  String error;
  num curIndex;
  PlayMode playMode;
  var list;
  QueueView({
    this.isLiked,
    this.shuffleMode,
    this.repeatMode,
    this.likeSnackBar,
    this.dislikeSnackBar,
    this.platformVersion,
    this.isPlaying,
    this.duration,
    this.slider,
    this.sliderVolume,
    this.error,
    this.curIndex,
    this.playMode,
    this.list,
  });
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
                                AudioManager.instance.info.title,
                                style: TextStyle(
                                  fontFamily: 'Gotham',
                                  color: Color.fromARGB(255, 167, 168, 170),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                AudioManager.instance.info.desc,
                                style: TextStyle(
                                  fontFamily: 'Gotham',
                                  color: Color.fromARGB(255, 117, 119, 122),
                                  fontSize: 16,
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
                              // * Fav Button
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
                            Container(child: Center(
                            child: Stack(
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
                                ClipOval(
                                  child: GestureDetector(
                                    onTap: () {
                                      print("tapped");
                                    },
                                    child: SizedBox(
                                      width: constraints.maxWidth * 0.4,
                                      height: constraints.maxWidth * 0.4,
                                      child: Text(''),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),),
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
                              itemCount: widget.list.length,
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
                                            return PlayerPage(
                                              isLiked: widget.isLiked,
                                              shuffleMode: widget.shuffleMode,
                                              repeatMode: widget.repeatMode,
                                              likeSnackBar: widget.likeSnackBar,
                                              dislikeSnackBar:
                                                  widget.dislikeSnackBar,
                                              platformVersion:
                                                  widget.platformVersion,
                                              isPlaying: widget.isPlaying,
                                              duration: widget.duration,
                                              slider: widget.slider,
                                              sliderVolume: widget.sliderVolume,
                                              error: widget.error,
                                              curIndex: widget.curIndex,
                                              playMode: widget.playMode,
                                              list: widget.list,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    trailing: Container(
                                      // * Play Button
                                      width: constraints.maxWidth * 0.101,
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
                                                        return PlayerPage(
                                                          isLiked:
                                                              widget.isLiked,
                                                          shuffleMode: widget
                                                              .shuffleMode,
                                                          repeatMode:
                                                              widget.repeatMode,
                                                          likeSnackBar: widget
                                                              .likeSnackBar,
                                                          dislikeSnackBar: widget
                                                              .dislikeSnackBar,
                                                          platformVersion: widget
                                                              .platformVersion,
                                                          isPlaying:
                                                              widget.isPlaying,
                                                          duration:
                                                              widget.duration,
                                                          slider: widget.slider,
                                                          sliderVolume: widget
                                                              .sliderVolume,
                                                          error: widget.error,
                                                          curIndex:
                                                              widget.curIndex,
                                                          playMode:
                                                              widget.playMode,
                                                          list: widget.list,
                                                        );
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
                                      widget.list[index]["title"],
                                      style:
                                          TextStyle(fontFamily: "Gotham"),
                                    ),
                                    subtitle: Text(widget.list[index]["desc"]),
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
