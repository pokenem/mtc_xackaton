import 'package:flutter/material.dart';
import 'package:mtc_xackaton/ui/widgets/banner.dart';

class TabMoney extends StatelessWidget {
  const TabMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          children: [
            SizedBox(height: 20),
            ConstrainedBox(
              constraints:
                  BoxConstraints.loose(Size(constraints.maxWidth, 200)),
              child: PageView(
                controller: PageController(viewportFraction: 0.9),
                children: [
                  MyBanner(child: ColoredBox(color: Colors.green)),
                  MyBanner(child: ColoredBox(color: Colors.orange)),
                  MyBanner(child: ColoredBox(color: Colors.cyan)),
                ],
              ),
            ),
            SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.yellow,
                ),
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
                height: 50,
              ),
            ),
          ],
        );
      },
    );
  }
}
