import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
        SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(
              'assets/images/details_heart.png',
              color: Colors.black87,
            )),
      ],
    );
  }
}
