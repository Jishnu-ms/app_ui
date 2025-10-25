import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final String? text; // made optional
  final Color? textColor; // optional now
  final Widget? icon; // new optional icon
  final VoidCallback onTap;
  final double height;
  final double borderRadius;
  final Color? borderColor;
  final double borderWidth;

  const CustomButton({
    Key? key,
    required this.buttonColor,
    this.text,
    this.textColor,
    this.icon,
    required this.onTap,
    this.height = 50,
    this.borderRadius = 8,
    this.borderColor,
    this.borderWidth = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: borderColor != null
              ? Border.all(color: borderColor!, width: borderWidth)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            if (text != null)
              Text(
                text!,
                style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
