import 'package:flutter/material.dart';

class TransitionListTile extends StatelessWidget {
  const TransitionListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  final GestureTapCallback? onTap;
  final Widget title;
  final Widget subtitle;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      leading: leading,
      onTap: onTap,
      title: title,
      subtitle: subtitle,
    );
  }
}
