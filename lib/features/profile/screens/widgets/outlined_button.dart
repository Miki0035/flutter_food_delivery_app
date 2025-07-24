import 'package:flutter/material.dart';

class FOutlinedButton extends StatelessWidget {
  final Color borderColor;
  final Color backgroundColor;
  final Widget widget;
  final VoidCallback? onPressed;

  const FOutlinedButton({
    super.key,
    required this.borderColor,
    required this.backgroundColor,
    required this.widget, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 10.0),

          side: BorderSide(color: borderColor, width: 1.0),
        ),
        child: widget,
      ),
    );
  }
}
