import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final double? height;
  final Function? onPressed;
  final bool isEnabled;

  const MyButton({
    Key? key,
    required this.label,
    this.height = 40,
    this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: 250,
      color: Colors.teal,
      disabledColor: Colors.grey,
      onPressed: isEnabled ? () {
        if (onPressed != null) {
          onPressed!();
        }
      } : null,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
