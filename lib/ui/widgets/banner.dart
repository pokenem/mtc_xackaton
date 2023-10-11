import 'package:flutter/material.dart';

class MyBanner extends StatelessWidget {
  final Widget child;

  const MyBanner({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: child,
    );
  }
}
