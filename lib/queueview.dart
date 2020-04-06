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

class QueueView extends StatefulWidget {
  @override
  _QueueViewState createState() => _QueueViewState();
}

class _QueueViewState extends State<QueueView> {
  bool isLiked = false;
  bool isPlayed = false;
  String shuffleMode = 'off'; // on, off
  String repeatMode = 'off'; //
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
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
                              children: <Widget>[
                                Container(
                                  // * Album Art
                                  width: constraints.maxWidth * 0.43,
                                  height: constraints.maxWidth * 0.43,
                                  child: AlbumArt(),
                                ),
                                // Container(
                                //   width: constraints.maxWidth * 0.83,
                                //   child: Center(
                                //     child: SizedBox(
                                //       width: 100,
                                //       height: 100,
                                //       child: FlareActor(
                                //         'assets/like.flr',
                                //         controller: flareControls,
                                //         animation: 'idle',
                                //       ),
                                //     ),
                                //   ),
                                // )
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
                      flex: 6,
                      child: ListView.builder(
                          itemCount: europeanCountries.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ListTile(
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
                                            foregroundColor: Colors.transparent,
                                            backgroundColor: Colors.transparent,
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
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text(
                                  europeanCountries[index],
                                  style: TextStyle(fontFamily: "Proxima Nova"),
                                ),
                                subtitle: Text(europeanCountries[index]),
                              ),
                            );
                          }))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
