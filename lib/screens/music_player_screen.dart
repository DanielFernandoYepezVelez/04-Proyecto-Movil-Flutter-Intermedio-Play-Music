import 'package:flutter/material.dart';

/* Custom Widgets */
import 'package:music_player/widgets/widgets.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const _BackgroundApp(),
          Column(
            children: const <Widget>[
              CustomAppBarWidget(),
              CustomImageDiskDurationWidget(),
              CustomNameBotonPlayWidget(),
              CustomLyricsSongWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class _BackgroundApp extends StatelessWidget {
  const _BackgroundApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        gradient: LinearGradient(
          end: Alignment.center,
          begin: Alignment.centerLeft,
          colors: [
            Color(0xff33333E),
            Color(0xff201E21),
          ],
        ),
      ),
    );
  }
}
