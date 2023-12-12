import 'package:flutter/material.dart';

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.phone,
      // Add validation logic if needed
    );
  }
}