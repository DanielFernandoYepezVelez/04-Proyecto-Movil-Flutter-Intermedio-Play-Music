import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

/* Models */
import 'package:music_player/models/models.dart';

class CustomImageDiskDurationWidget extends StatelessWidget {
  const CustomImageDiskDurationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          _ContainerImageDisk(),
          _ProgessDuration(),
        ],
      ),
    );
  }
}

class _ContainerImageDisk extends StatelessWidget {
  const _ContainerImageDisk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return Container(
      width: 220,
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: <Color>[
            Color(0xff484750),
            Color(0xff1E1C24),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              infinite: true,
              animate: false,
              manualTrigger: true,
              controller: (animationControllerArgs) {
                return audioPlayerModel.animationController =
                    animationControllerArgs;
              },
              duration: const Duration(seconds: 10),
              child: const Image(
                image: AssetImage('assets/images/aurora.jpg'),
              ),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: const Color(0xff1C1C25),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgessDuration extends StatelessWidget {
  const _ProgessDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle styleText = TextStyle(color: Colors.white.withOpacity(0.4));

    return Column(
      children: [
        Text('00:00', style: styleText),
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              width: 3,
              height: 230,
              color: Colors.white.withOpacity(0.1),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 3,
                height: 150,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text('00:00', style: styleText),
      ],
    );
  }
}
