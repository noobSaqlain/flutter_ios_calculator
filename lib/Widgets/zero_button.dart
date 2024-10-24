import 'package:flutter/material.dart';

class CreateZerosButton extends StatelessWidget {
  String? buttonText;
  Color? buttonGroundColor;
  Color? buttonTextColor;
  CreateZerosButton(
    this.buttonText,
    this.buttonGroundColor,
    this.buttonTextColor, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 75,
      child: ElevatedButton(
        onPressed: () {
          // Your onPressed code here
        },
        style: ElevatedButton.styleFrom(
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
