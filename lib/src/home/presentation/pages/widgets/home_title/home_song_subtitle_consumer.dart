import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/home/presentation/controllers/songs_info_controller.dart';
import 'package:provider/provider.dart';

class SongSubTitleConsumer extends StatelessWidget {
  const SongSubTitleConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SongInfoControllerProvider>(
        builder: (ctx, info, child) => Text(
              info.myInfo.chart,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white70,
              ),
            ));
  }
}
