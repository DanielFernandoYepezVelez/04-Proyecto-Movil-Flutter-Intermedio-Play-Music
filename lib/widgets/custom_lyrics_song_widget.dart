import 'package:flutter/material.dart';

/* Helpers */
import 'package:music_player/helpers/helpers.dart';

class CustomLyricsSongWidget extends StatelessWidget {
  const CustomLyricsSongWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> lyrics = getLyrics();

    return Container(
      height: 222,
      child: ListWheelScrollView(
        physics: const BouncingScrollPhysics(),
        itemExtent: 42,
        diameterRatio: 1.5,
        children: lyrics
            .map(
              (linea) => Text(
                linea,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
