import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _playing = false;
  late AnimationController _animationController;
  Duration _currentSong = const Duration(milliseconds: 0);
  Duration _songDuration = const Duration(milliseconds: 0);

  String get songSecondCurrent => printDuration(_currentSong);
  String get songTotalDuration => printDuration(_songDuration);

  set animationController(AnimationController value) {
    _animationController = value;
  }

  AnimationController get animationController => _animationController;

  bool get playing => _playing;

  set playing(bool value) {
    _playing = value;
    notifyListeners();
  }

  Duration get currentSong => _currentSong;

  set currentSong(Duration value) {
    _currentSong = value;
    notifyListeners();
  }

  Duration get songDuration => _songDuration;

  set songDuration(Duration value) {
    _songDuration = value;
    notifyListeners();
  }

  double get percentSong => (_songDuration.inSeconds > 0)
      ? _currentSong.inSeconds / _songDuration.inSeconds
      : 0;

  String printDuration(Duration duration) {
    String twoDigits(int value) {
      if (value >= 10) return '$value';
      return '0$value';
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    // return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
