import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/home/presentation/pages/widgets/home_detail/home_song_detail_transition_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../controllers/songs_list_controller.dart';

class SongListConsumer extends StatelessWidget {
  const SongListConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SongListHomeControllerProvider>(
      builder: (ctx, songList, child) => ListView.builder(
          itemCount: songList.myList.length,
          itemBuilder: (context, idx) {
            return GestureDetector(
              onTap: () => context.go(
                '/details',
                extra: songList.myList[idx].title,
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TransitionListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xff764abc),
                      child: Text(songList.myList[idx].rank),
                    ),
                    title: Text(
                      songList.myList[idx].title,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      songList.myList[idx].artist,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )),
            );
          }),
    );
  }
}
