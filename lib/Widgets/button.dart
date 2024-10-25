import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/provider.dart';
import 'package:ios_calculator/main.dart';
import 'package:provider/provider.dart';

class CreateButton extends StatelessWidget {
  String? buttonText;
  Color? buttonGroundColor;
  Color? buttonTextColor;
  double? width;
  double? height;
  CreateButton(
    this.buttonText,
    this.buttonGroundColor,
    this.buttonTextColor, {
    this.height = 75,
    this.width = 75,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ElevatedButton(
        onPressed: () {
          // Your onPressed code here
          var res = context.read<Result>();
          res.calculate(buttonText!);
        },
        style: ElevatedButton.styleFrom(
          shape: (buttonText == "0") ? null : const CircleBorder(),
          padding: EdgeInsets.zero,
          shadowColor: Colors.transparent,
          backgroundColor: buttonGroundColor,
        ),
        child: Text(
          buttonText ?? " ",
          style: TextStyle(
            color: buttonTextColor,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
