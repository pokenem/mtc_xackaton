import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:mtc_xackaton/ui/navigation/navigation_manager.dart';

PreferredSizeWidget createAppBar({
  bool hasBackButton = false,
  bool hasListButton = true,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    shadowColor: Colors.transparent,
    backgroundColor: const Color(0xFFF7F7F7),
    centerTitle: true,
    title: const Text(
      'Сертификаты',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 24 / 20,
      ),
    ),
    leading: hasBackButton ? IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () {
        GetIt.I.get<NavigationManager>().pop();
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
                child: InkWell(
                  onTap: () {
                    GetIt.I.get<NavigationManager>().openMyCertificatesPage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SvgPicture.asset('assets/certificate.svg'),
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
