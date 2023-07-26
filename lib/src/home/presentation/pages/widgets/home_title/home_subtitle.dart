import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/home/presentation/controllers/songs_info_controller.dart';
import 'package:flutter_radio_player_2/src/home/presentation/pages/widgets/home_title/home_song_subtitle_consumer.dart';
import 'package:provider/provider.dart';

class HomeSubTitle extends StatelessWidget {
  const HomeSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<SongInfoControllerProvider>(
          context,
          listen: false,
        ).updateSongInfo(), // already initialized, won't re-initalize when build() is called
        builder: (ctx, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: Text(''),
            );
          }

          return const SongSubTitleConsumer();
        });
  }
}
