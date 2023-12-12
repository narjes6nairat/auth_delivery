import 'package:flutter/material.dart';

class RecoveryButton extends StatelessWidget {
  const RecoveryButton({Key? key, required this.onPressed}) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Recover Password'),
    );
  }
}
