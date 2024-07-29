import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.height = 80});

  final VoidCallback onPressed;
  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height)),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}