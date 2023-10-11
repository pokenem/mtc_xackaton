import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget createAppBar({
  bool hasBackButton = false,
  bool hasListButton = true,
}) {
  return AppBar(
    shadowColor: Colors.transparent,
    backgroundColor: Color(0xFFF7F7F7),
    centerTitle: true,
    title: const Text(
      "Сертификаты",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 24 / 20,
      ),
    ),
    actions: [
      if (hasListButton)
        SizedBox(
          height: 51,
          width: 51,
          child: InkWell(
            child: SvgPicture.asset('assets/sertificate.svg'),
            onTap: () {
              //На страницу моих сертификатов
            },
          ),
        ),
    ],
  );
}

PreferredSizeWidget createAppBarTabs({
  bool hasBackButton = false,
  bool hasListButton = true,
}) {
  return AppBar(
    shadowColor: Colors.transparent,
    backgroundColor: Color(0xFFF7F7F7),
    centerTitle: true,
    title: const Text(
      "Сертификаты",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 24 / 20,
      ),
    ),
    actions: [
      if (hasListButton)
        SizedBox(
          height: 51,
          width: 51,
          child: InkWell(
            child: SvgPicture.asset('assets/sertificate.svg'),
            onTap: () {
              //На страницу моих сертификатов
            },
          ),
        ),
    ],
    bottom: const TabBar(
      indicatorColor: Colors.red,
      labelColor: Colors.black,
      tabs: [
        Tab(text: "НОМИНАЛЬНЫЕ"),
        Tab(text: "НА УСЛУГИ"),
      ],
    ),
  );
}
