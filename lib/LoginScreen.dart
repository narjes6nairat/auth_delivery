import 'package:flutter/material.dart';
import 'ForgotPassword.dart';
import 'LoginButton.dart';
import 'PasswordInput.dart';
import 'PhoneNumberInput.dart';
import 'RememberMeCheckbox.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(
        'Login',
        style: TextStyle(
          fontSize: 35, // Adjust the font size as needed
          fontFamily:'strutStyle', // Set the custom font family
          fontWeight: FontWeight.bold, // Optionally set the font weight
        ),
      ),
          foregroundColor: Colors.deepOrangeAccent),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:SingleChildScrollView(//note:shahd
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // Insert the Image widget before the other login components
              Image.asset(
                'assets/deliveryLogin.jpg',
                height: 350, // Adjust the height as needed
                // You can also add other properties like width, fit, etc.
              ),
              const SizedBox(height: 8), // Adjust spacing as needed
              const PhoneNumberInput(),
              const SizedBox(height: 20),
              const PasswordInput(),
              const SizedBox(height: 5),
              const RememberMeCheckbox(),
              const SizedBox(height: 10),
              LoginButton(
              onPressed: () {
                // Implement login logic here
              },
            ),
              const SizedBox(height: 21.0),
              const ForgotPassword(),
            ],
          ),
        )
      ),
    );
  }

}