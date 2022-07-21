import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function? onPressed;

  const MyButton({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 250,
      color: Colors.teal,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
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
