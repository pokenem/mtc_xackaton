import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mtc_xackaton/model/certificate.dart';

class CertificateTile extends StatelessWidget {
  final String title;
  final int cost;
  final void Function() onTap;

  CertificateTile({
    super.key,
    required this.title,
    required this.cost,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xFFD9D9D9),
          ),
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                    color: Colors.black,
                  ),
                ),
              ),
              //Image
              SizedBox(
                height: 70,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 110,
                            bottom: 15,
                          ),
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: InkWell(
                              onTap: onTap,
                              child: SvgPicture.asset('assets/gift.svg'),
                              //   () {
                              //   Share.share(
                              //       'aboba (Этот текст отправлен из приложения)');
                              // },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                            bottom: 15,
                          ),
                          child: SizedBox(
                            width: 85,
                            height: 30,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xFFD2D2D2),
                              ),
                              child: Center(child: Text('$cost BYN')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
