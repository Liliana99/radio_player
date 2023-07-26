import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/home/presentation/pages/widgets/home_action_button.dart';
import 'package:flutter_radio_player_2/src/home/presentation/pages/widgets/home_detail/home_song_list_container.dart';
import 'package:flutter_radio_player_2/src/home/presentation/pages/widgets/home_row.dart';
import 'package:flutter_radio_player_2/src/home/presentation/pages/widgets/home_title/home_song_title_icon.dart';
import 'package:flutter_radio_player_2/src/home/presentation/pages/widgets/home_top_container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> topWidget() {
    List<Widget> listWidgets = [];

    return listWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const GenerateRowHomeScreen(
                mainChild: HomeTopContainer(
                  colorCotainer: Color.fromARGB(255, 242, 132, 169),
                  imagePath: 'assets/images/home_image.png',
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: HomeActionButton(),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 20, top: MediaQuery.of(context).size.height * 0.07),
                  child: const HomeSongTitleIcon()),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: GenerateRowHomeScreen(
                mainChild: HomeSongListContainer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
