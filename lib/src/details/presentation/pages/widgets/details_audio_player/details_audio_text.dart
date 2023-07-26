import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/utils/string_format_time.dart';

class DetailsAudioPlayerText extends StatelessWidget {
  const DetailsAudioPlayerText(
      {super.key, required this.position, required this.duration});
  final Duration duration;
  final Duration position;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(formatTime(position)),
        Text(formatTime(duration - position)),
      ],
    );
  }
}
