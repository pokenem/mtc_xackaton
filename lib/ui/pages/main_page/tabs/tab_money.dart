import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mtc_xackaton/model/certificate.dart';
import 'package:mtc_xackaton/ui/navigation/navigation_manager.dart';
import 'package:mtc_xackaton/ui/widgets/banner.dart';

int nCategories = 4;
List<String> categories = [
  'ВСЕ КАТЕГОРИИ',
  'БЕБЕБЕ',
  'БАБАБА',
  'БУБУБУ',
];

class TabMoney extends StatefulWidget {
  const TabMoney({super.key});

  @override
  State<TabMoney> createState() => _TabMoneyState();
}

class _TabMoneyState extends State<TabMoney> {
  int categoryInd = 0;
  double amount = 50;

  late PageController pageController;
  late TextEditingController textController;

  void onChangeCategory(int newCategoryInd) {
    setState(() {
      categoryInd = newCategoryInd;
    });
  }

  void onBuy(BuildContext context) {
    GetIt.I.get<NavMan>().openOrderPage(
          CertificateMoney(
            groupId: categoryInd.toString(),
            amount: amount.round(),
          ),
        );
  }

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 0.9);

    textController = TextEditingController(text: amount.round().toString());
    textController.addListener(() {
      setState(() {
        amount =
            textController.text.isEmpty ? 0 : double.parse(textController.text);
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          children: [
            const SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFD9D9D9)),
                  color: const Color(0xFFF7F7F7),
                ),
                alignment: Alignment.center,
                height: 45,
                child: Text(
                  categories[categoryInd],
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Arial',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints:
                  BoxConstraints.loose(Size(constraints.maxWidth, 200)),
              child: PageView.builder(
                controller: pageController,
                onPageChanged: onChangeCategory,
                itemCount: nCategories,
                itemBuilder: (BuildContext context, int index) => MyBanner(
                  child: ColoredBox(
                    color: Color(categories[index].hashCode),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFD9D9D9)),
                  color: const Color(0xFFF7F7F7),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'СУММА',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Arial',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 30,
                      child: TextField(
                        controller: textController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        cursorColor: const Color(0xFFed1d24),
                        style: const TextStyle(
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Slider(
                      activeColor: const Color(0xFFed1d24),
                      inactiveColor: const Color(0xffe7bfc1),
                      value: clampDouble(amount / 50, 1, 5),
                      divisions: 4,
                      onChanged: (value) {
                        setState(() {
                          amount = value * 50;
                          textController.text = amount.round().toString();
                        });
                      },
                      min: 1,
                      max: 5,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Material(
                  color: const Color(0xFFed1d24),
                  child: InkWell(
                    onTap: () => onBuy(context),
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      child: const Text(
                        'КУПИТЬ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Arial',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
