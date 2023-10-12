import 'package:flutter/material.dart';
import 'package:mtc_xackaton/ui/pages/main_page/tabs/tab_money.dart';
import 'package:mtc_xackaton/ui/pages/main_page/tabs/tab_service.dart';
import 'package:mtc_xackaton/ui/widgets/app_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: createAppBar(
            bottom: const TabBar(
          indicatorColor: Colors.red,
          labelColor: Colors.black,
          tabs: [
            Tab(text: 'НОМИНАЛЬНЫЕ'),
            Tab(text: 'НА УСЛУГИ'),
          ],
        )),
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
