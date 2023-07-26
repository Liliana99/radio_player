import 'package:flutter/material.dart';

class HomeActionButton extends StatelessWidget {
  const HomeActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width * 0.20,
      child: FloatingActionButton(
        elevation: 50,
        onPressed: () {},
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(90.0),
          ),
        ),
        child: const Icon(
          Icons.play_arrow_rounded,
          size: 50,
          color: Color.fromARGB(255, 51, 32, 105),
        ),
      ),
    );
  }
}
