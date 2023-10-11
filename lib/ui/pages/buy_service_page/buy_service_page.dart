import 'package:flutter/material.dart';
import 'package:mtc_xackaton/ui/widgets/app_bar.dart';

class BuyServicePage extends StatelessWidget {
  final String name;
  final String description;

  const BuyServicePage({Key? key, required this.name, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(
        hasListButton: true,
        hasBackButton: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.grey,
                      ),
                      height: 250,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      height: 23 / 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.grey,
                        border: Border.all(
                          width: 1,
                          color: Color(0xFFD2D2D2),
                        ),
                      ),
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(description),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Material(
                        color: const Color(0xFFed1d24),
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            child: const Text(
                              "КУПИТЬ",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Arial",
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}