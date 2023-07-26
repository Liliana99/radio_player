import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/home/presentation/controllers/songs_info_controller.dart';
import 'package:provider/provider.dart';

class SongTitleConsumer extends StatelessWidget {
  const SongTitleConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SongInfoControllerProvider>(
        builder: (ctx, info, child) => Text(
              info.myInfo.category,
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ));
  }
}
