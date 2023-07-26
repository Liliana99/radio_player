import 'package:flutter/material.dart';

class GenerateRowHomeScreen extends StatelessWidget {
  const GenerateRowHomeScreen({
    super.key,
    this.secundaryChild,
    required this.mainChild,
  });
  final Widget mainChild;
  final Widget? secundaryChild;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: SizedBox(
            width: 10,
          ),
        ),
        Expanded(
          flex: 12,
          child: mainChild,
        ),
      ],
    );
  }
}
