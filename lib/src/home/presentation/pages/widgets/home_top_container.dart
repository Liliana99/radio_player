import 'package:flutter/material.dart';

class HomeTopContainer extends StatefulWidget {
  const HomeTopContainer({
    super.key,
    this.child,
    required this.colorCotainer,
    required this.imagePath,
  });
  final Widget? child;
  final Color colorCotainer;
  final String imagePath;

  @override
  State<HomeTopContainer> createState() => _HomeTopContainerState();
}

class _HomeTopContainerState extends State<HomeTopContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: widget.colorCotainer,
        image: obtainImage(widget.imagePath),
        border: Border.all(
          color: widget.colorCotainer,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(80),
        ),
      ),
      child: widget.child ?? const Text(''),
    );
  }

  DecorationImage? obtainImage(String imagePath) {
    return DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.cover,
    );
  }
}
