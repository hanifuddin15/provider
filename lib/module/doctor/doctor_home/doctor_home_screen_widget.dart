import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorHomeScreenCard extends StatelessWidget {
  DoctorHomeScreenCard(
      {Key? key,
      required this.title,
      required this.assetPath,
      required this.backgroundColor,
      required this.circleBackgroundColor,
      required this.number,
      required this.shadowColor,
      required this.numberColor})
      : super(key: key);

  String assetPath;
  String number;
  String title;
  Color backgroundColor;
  Color circleBackgroundColor;
  Color shadowColor;
  Color numberColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: Get.width * .45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: backgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              height: Get.width * .45 * .25,
              width: Get.width * .45 * .25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: circleBackgroundColor),
              child: SvgPicture.asset(assetPath),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: (Get.width * .45) - 30,
              child: Center(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.mukta(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      elevation: 2,
      shadowColor: shadowColor,
      borderRadius: BorderRadius.circular(15),
    );
  }
}
