import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/home/presentation/pages/widgets/home_detail/home_songs_list.dart';

class HomeSongListContainer extends StatelessWidget {
  const HomeSongListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 59, 33, 131),
        border: Border.all(
          color: const Color.fromARGB(255, 45, 29, 88),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(80),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 20.0, left: 10),
        child: SongListHome(),
      ),
    );
  }
}
