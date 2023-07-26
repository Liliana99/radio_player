import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/home/presentation/controllers/songs_list_controller.dart';
import 'package:provider/provider.dart';

import 'home_song_list_consumer.dart';

class SongListHome extends StatelessWidget {
  const SongListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<SongListHomeControllerProvider>(
          context,
          listen: false,
        ).updateSongList(), // already initialized, won't re-initalize when build() is called
        builder: (ctx, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: Text('No hay datos, para mostar'),
            );
          }

          return const SongListConsumer();
        });
  }
}
