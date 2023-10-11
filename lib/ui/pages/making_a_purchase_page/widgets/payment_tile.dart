import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentTile extends StatelessWidget {
  final String way;
  final SvgPicture image;

  const PaymentTile({Key? key, required this.way, required this.image}) : super(key: key);

  void onGoToPay() async {
    final uri = Uri.parse('https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // can't launch url
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 11,
      ),
      child: InkWell(
        onTap: (){onGoToPay();},
        child: ListTile(
          title: Text(way),
          trailing: SizedBox(
            width: 33,
            height: 33,
            child: image,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFD2D2D2), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
