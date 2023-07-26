import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/home/presentation/pages/widgets/home_title/home_title.dart';

class HomeSongTitleIcon extends StatelessWidget {
  const HomeSongTitleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(flex: 2, child: HomeTitle()),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: SizedBox(
            height: 20,
            child: Image.asset(
              'assets/images/home_lista.png',
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
