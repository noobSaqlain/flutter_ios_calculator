import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  String? buttonText;
  Color? buttonGroundColor;
  Color? buttonTextColor;
  CreateButton(
    this.buttonText,
    this.buttonGroundColor,
    this.buttonTextColor, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ElevatedButton(
        onPressed: () {
          // Your onPressed code here
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
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
