import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {
  final Color? greenTitleColor;
  final double textSize;
  // final String? leftName;
  // final String? rightName;

  const AppNameWidget({
    Key? key,
    this.greenTitleColor,
    this.textSize = 30,
    // this.leftName,
    // this.rightName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(
              // fontFamily: 'IndieFlower',
              color: greenTitleColor ?? CustomColors.customSwatchColor,
            ),
          ),
          TextSpan(
            text: 'grocer',
            style: TextStyle(
              color: CustomColors.customContrastColor,
            ),
          ),
        ],
      ),
    );
  }
}
