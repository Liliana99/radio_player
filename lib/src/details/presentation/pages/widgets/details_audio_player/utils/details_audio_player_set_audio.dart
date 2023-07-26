import 'package:audioplayers/audioplayers.dart';

Future<void> setAudio(final AudioPlayer player) async {
  player.setReleaseMode(ReleaseMode.loop);
  await player.play(AssetSource('sounds/shape_of_you.mp3'));
}
