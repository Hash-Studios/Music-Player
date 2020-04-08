import 'package:flutter/material.dart';
import 'package:audio_manager/audio_manager.dart';

class AudioData {
  static List<Map> list = [
    {
      "title": "End of Time",
      "desc": "K-391, Alan Walker & Ahrix",
      "url": "assets/songs/audio.mp3",
      "coverUrl": "assets/album art/album_art.png"
    },
    {
      "title": "SOS",
      "desc": "Avicii",
      "url": "assets/songs/audio2.mp3",
      "coverUrl": "assets/album art/album_art2.png"
    },
    {
      "title": "Let Me Love You",
      "desc": "DJ Snake",
      "url": "assets/songs/DJ Snake - Let Me Love You.mp3",
      "coverUrl": "assets/album art/album_art3.png"
    },
    {
      "title": "Alone",
      "desc": "Alan Walker",
      "url": "assets/songs/Alan Walker - Alone.mp3",
      "coverUrl": "assets/album art/album_art6.png"
    },
    {
      "title": "Bones",
      "desc": "Clarx",
      "url": "assets/songs/Clarx - Bones.mp3",
      "coverUrl": "assets/album art/album_art5.png"
    },
    {
      "title": "Heaven",
      "desc": "Avicii",
      "url": "assets/songs/Avicii - Heaven.mp3",
      "coverUrl": "assets/album art/album_art8.png"
    },
    {
      "title": "Le Freak",
      "desc": "Chic",
      "url": "assets/songs/Chic - Le Freak.mp3",
      "coverUrl": "assets/album art/album_art7.png"
    },
    {
      "title": "Might Not Like Me",
      "desc": "Brynn Elliott",
      "url": "assets/songs/Brynn Elliott - Might Not Like Me.mp3",
      "coverUrl": "assets/album art/album_art4.png"
    },
  ];
  static bool isLiked = false;
  static String shuffleMode = 'off'; // on, off
  static String repeatMode = 'off'; // on, off, one
  static final likeSnackBar = SnackBar(
    content: Text('Yay! Added to favourites!'),
    backgroundColor: Colors.white24,
    duration: Duration(milliseconds: 500),
    elevation: 10,
  );
  static final dislikeSnackBar = SnackBar(
    content: Text('Removed from favourites!'),
    backgroundColor: Colors.white24,
    duration: Duration(milliseconds: 500),
    elevation: 10,
  );

  static String _platformVersion = 'Unknown';
  static bool isPlaying = false;
  static Duration _duration;
  static Duration _position;
  static double _slider = 0;
  static double _sliderVolume;
  static String _error;
  static num curIndex = 0;
  static PlayMode playMode = AudioManager.instance.playMode;

  static bool get getIsLiked => isLiked;
  static String get getShuffleMode => shuffleMode;
  static String get getRepeatMode => repeatMode;
  static SnackBar get getLikeSnackBar => likeSnackBar;
  static SnackBar get getDislikeSnackBar => dislikeSnackBar;
  static String get getPlatformVersion => _platformVersion;
  static bool get getIsPlaying => isPlaying;
  static Duration get getDuration => _duration;
  static Duration get getPosition => _position;
  static double get getSlider => _slider = 0;
  static double get getSliderVolume => _sliderVolume;
  static String get getError => _error;
  static num get getCurIndex => curIndex = 0;
  static PlayMode get getPlayMode => playMode;
  static List get getList => list;
}
