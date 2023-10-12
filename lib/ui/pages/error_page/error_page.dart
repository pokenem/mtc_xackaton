import 'package:flutter/material.dart';

import 'package:mtc_xackaton/ui/styles/app_color.dart';

class ErrorPage extends StatelessWidget {
  final String text;

  const ErrorPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: AppColor.red,
            fontFamily: 'Arial',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.25,
            height: 16 / 13,
          ),
        ),
      ),
    );
  }
}
