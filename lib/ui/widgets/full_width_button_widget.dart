import 'package:flutter/material.dart';

class FullWidthButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color buttonColor;
  final Color? textColor;
  final Icon? icon;

  FullWidthButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.buttonColor,
    this.textColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return MaterialButton(
      onPressed: onPressed,
      child: Center(
        child: icon == null
            ? Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
      ),
      color: buttonColor,
      elevation: 0,
      minWidth: width * 0.85,
      height: 50,
      textColor: textColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
