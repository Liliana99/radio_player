import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DetailSongPlayButton extends StatelessWidget {
  const DetailSongPlayButton(
      {super.key, required this.isPlaying, required this.player});
  final bool isPlaying;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width * 0.20,
      child: FloatingActionButton(
        elevation: 20,
        onPressed: () async {
          if (isPlaying) {
            await player.pause();
          } else {
            await player.resume();
          }
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(90.0),
          ),
        ),
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow_rounded,
          size: 40,
          color: const Color.fromARGB(255, 51, 32, 105),
        ),
      ),
    );
  }
}
