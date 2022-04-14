import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

/* Model App */
import 'package:music_player/models/models.dart';

class CustomNameBotonPlayWidget extends StatelessWidget {
  const CustomNameBotonPlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          _NameSong(),
          _BotonPlay(),
        ],
      ),
    );
  }
}

class _NameSong extends StatelessWidget {
  const _NameSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Far Away',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        Text(
          '-Breaking Benjamin',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

class _BotonPlay extends StatefulWidget {
  const _BotonPlay({Key? key}) : super(key: key);

  @override
  State<_BotonPlay> createState() => _BotonPlayState();
}

class _BotonPlayState extends State<_BotonPlay> with TickerProviderStateMixin {
  bool isPlaying = false;
  bool firstTime = true;
  // late AssetsAudioPlayer assetAudioPlayer;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  /* void open() {
    final audioPlayerModel =
        Provider.of<AudioPlayerModel>(context, listen: false);

    assetAudioPlayer.open(
      Audio("assets/music/Breaking-Benjamin-Far-Away.mp3"),
      autoStart: true,
      showNotification: true,
    );

    assetAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.currentSong = duration;
    });

    assetAudioPlayer.current.listen((playingAudio) {
      audioPlayerModel.songDuration =
          playingAudio?.audio.duration ?? const Duration(seconds: 0);
    });
  } */

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel =
        Provider.of<AudioPlayerModel>(context, listen: false);

    return FloatingActionButton(
      elevation: 0,
      highlightElevation: 0,
      backgroundColor: const Color(0xffF8CB51),
      child: AnimatedIcon(
        progress: animationController,
        icon: AnimatedIcons.play_pause,
      ),
      onPressed: () {
        if (isPlaying) {
          isPlaying = false;
          animationController.reverse();
          audioPlayerModel.animationController.stop();
        } else {
          isPlaying = true;
          animationController.forward();
          audioPlayerModel.animationController.repeat();
        }

        /* if (firstTime) {
          open();
          firstTime = false;
        } else {
          assetAudioPlayer.playOrPause();
        } */
      },
    );
  }
}
