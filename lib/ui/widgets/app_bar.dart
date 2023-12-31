import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:mtc_xackaton/ui/navigation/navigation_manager.dart';

import '../assets.dart';
import '../styles/app_color.dart';

PreferredSizeWidget createAppBar({
  String title = 'Сертификаты',
  bool hasBackButton = false,
  bool hasListButton = true,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    shadowColor: Colors.transparent,
    backgroundColor: const Color(0xFFF7F7F7),
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: AppColor.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 24 / 20,
      ),
    ),
    leading: hasBackButton ? IconButton(
      icon: const Icon(Icons.arrow_back, color: AppColor.black),
      onPressed: () {
        GetIt.I.get<NavMan>().pop();
      },
    ) : null,
    actions: [
      if (hasListButton)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: 40,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: const Color(0xFFF7F7F7),
                child: InkWell(
                  onTap: () {
                    GetIt.I.get<NavMan>().openMyCertificatesPage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SvgPicture.asset(Assets.certificate),
                  ),
                ),
              ),
            ),
          ),
        ),
      if (hasListButton) const SizedBox(width: 10),
    ],
    bottom: bottom,
  );
}
