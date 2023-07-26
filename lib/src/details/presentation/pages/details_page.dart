import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/details/presentation/pages/widgets/details_app_bar.dart';
import 'package:flutter_radio_player_2/src/details/presentation/pages/widgets/details_audio_player/details_audio_player.dart';
import 'package:lottie/lottie.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, this.title, this.artis});
  final String? title;
  final String? artis;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () => Navigator.of(context).pop(),
      // Start of the optional properties
      isFullScreen: false,
      disabled: false,
      minRadius: 10,
      maxRadius: 10,
      dragSensitivity: 1.0,
      maxTransformValue: .8,
      direction: DismissiblePageDismissDirection.multi,
      backgroundColor: const Color.fromARGB(255, 242, 132, 169),
      onDragStart: () {},
      dismissThresholds: const {
        DismissiblePageDismissDirection.vertical: .2,
      },
      minScale: .8,
      startingOpacity: 1,
      reverseDuration: const Duration(milliseconds: 250),
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: const Color(0xFFF284A9),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: const DetailsAppBar(),
                ),
                Expanded(
                  flex: 3,
                  child: Lottie.asset('assets/details_animation_music.json'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      widget.title ?? '',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                const Flexible(child: DetailsAudioPlayer()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
