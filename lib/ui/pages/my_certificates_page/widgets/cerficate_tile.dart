import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';

import '../../../assets.dart';
import '../../../styles/app_color.dart';

class CertificateTile extends StatelessWidget {
  final String title;
  final int cost;
  final bool isShare;
  final String image;
  final void Function() onTap;

  const CertificateTile({
    super.key,
    required this.title,
    required this.cost,
    required this.isShare,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return isShare
        ? tile()
        : GestureDetector(
            onTap: onTap,
            child: tile(),
          );
  }

  Widget tile() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xFFD9D9D9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                ),
                child: Image.network(image),
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
                            fontFamily: 'Arial',
                            letterSpacing: 1.25,
                          ),
                        ),
                      ),
                      if (isShare)
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 110,
                              bottom: 15,
                            ),
                            child: SizedBox(
                              height: 35,
                              width: 35,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SvgPicture.asset(Assets.gift),
                                        ),
                                        onTap: () {
                                          Share.share('aboba (Этот текст отправлен из приложения)');
                                        },
                                      ))),
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
                                color: const Color(0xFFBCBCBC),
                              ),
                              child: Center(child: Text('$cost BYN',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Arial',
                                height: 16 / 14,
                              ),)),
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
