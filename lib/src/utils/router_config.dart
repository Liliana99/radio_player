import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

import '../details/presentation/pages/details_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(
          title: '',
        );
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'details',
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            final name = state.extra! as String;
            final artist = state.extra! as String;
            return DetailsPage(
              title: name,
              artis: artist,
            );
          },
        ),
      ],
    ),
  ],
);
