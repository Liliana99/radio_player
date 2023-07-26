import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_radio_player_2/src/home/domain/models/info_model.dart';
import 'package:flutter_radio_player_2/src/home/presentation/controllers/songs_info_controller.dart';
import 'package:flutter_radio_player_2/src/home/presentation/controllers/songs_list_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'src/utils/router_config.dart';

void main() {
  WidgetsFlutterBinding();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  ChartInfo charInfo = ChartInfo(category: '', chart: '', date: '', source: '');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SongInfoControllerProvider>(
          create: (_) => SongInfoControllerProvider(charInfo),
        ),
        ChangeNotifierProvider<SongListHomeControllerProvider>(
          create: (_) => SongListHomeControllerProvider([]),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFF673AB7),
          fontFamily: GoogleFonts.lobster().fontFamily),
      routerConfig: router,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
