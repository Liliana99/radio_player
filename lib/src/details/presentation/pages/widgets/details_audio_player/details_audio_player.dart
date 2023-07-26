import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/details/presentation/pages/widgets/details_audio_player/details_audio_text.dart';
import 'package:flutter_radio_player_2/src/details/presentation/pages/widgets/details_audio_player/utils/details_audio_player_set_audio.dart';

import 'detail_audio_player_play_button.dart';

class DetailsAudioPlayer extends StatefulWidget {
  const DetailsAudioPlayer({super.key});

  @override
  State<DetailsAudioPlayer> createState() => _DetailsAudioPlayerState();
}

class _DetailsAudioPlayerState extends State<DetailsAudioPlayer> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      player.onPlayerStateChanged.listen((state) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      });
      player.onDurationChanged.listen((newDuration) {
        setState(() {
          duration = newDuration;
        });
      });

      player.onPositionChanged.listen((newPosition) {
        position = newPosition;
      });
      setAudio(player);
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await player.seek(position);
                await player.resume();
              }),
        ),
        Flexible(
            child:
                DetailsAudioPlayerText(position: position, duration: duration)),
        Flexible(
          flex: 2,
          child: DetailSongPlayButton(
            isPlaying: isPlaying,
            player: player,
          ),
        ),
      ],
    );
  }
}
