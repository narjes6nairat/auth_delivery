import 'package:flutter/material.dart';
final _formkey = GlobalKey<FormState>();
class RecoveryInputField extends StatelessWidget {
  const RecoveryInputField({super.key});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Enter Registered Email',

        border: OutlineInputBorder(),

      ),
      keyboardType: TextInputType.emailAddress,
      // Validation and other properties as needed

    );
  }
}
