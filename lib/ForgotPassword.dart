import 'package:flutter/material.dart';
import 'PasswordRecoveryScreen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the PasswordRecoveryScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  const PasswordRecoveryScreen(),
          ),
        );
      },
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,


        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}