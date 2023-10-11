import 'package:flutter/material.dart';

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
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      if (hasListButton)
        const SizedBox(
          height: 51,
          width: 51,
          child: ColoredBox(
            color: Colors.red,
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
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      if (hasListButton)
        const SizedBox(
          height: 51,
          width: 51,
          child: ColoredBox(
            color: Colors.red,
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