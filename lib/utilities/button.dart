import 'package:flutter/material.dart';

class Appbutton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const Appbutton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent),
      child: Text(buttonText),
    );
  }
}
