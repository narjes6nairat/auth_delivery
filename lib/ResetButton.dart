import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ResetButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Reset Password',
          style: TextStyle(
              color: Colors.deepOrangeAccent
          )),
    );
  }
}