import 'package:flutter/material.dart';
import 'package:mtc_xackaton/ui/pages/main_page/tabs/tab_money.dart';
import 'package:mtc_xackaton/ui/pages/main_page/tabs/tab_service.dart';
import 'package:mtc_xackaton/ui/widgets/app_bar.dart';

import '../../styles/app_color.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: createAppBar(
          bottom: const TabBar(
            unselectedLabelColor: AppColor.lightGrey,
            indicatorColor: AppColor.red,
            labelColor: AppColor.red,
            labelStyle: TextStyle(
              fontFamily: 'Arial',
              fontWeight: FontWeight.w700,
              letterSpacing: 1.25,
              height: 16 / 13,
              fontSize: 13,
            ),
            tabs: [
              Tab(text: 'НОМИНАЛЬНЫЕ',),
              Tab(text: 'НА УСЛУГИ'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TabMoney(),
            TabService(),
          ],
        ),
      ),
    );
  }
}
