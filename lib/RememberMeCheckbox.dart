import 'package:flutter/material.dart';

class RememberMeCheckbox extends StatefulWidget {
  const RememberMeCheckbox({super.key});

  @override
  _RememberMeCheckboxState createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('Remember Me'),
      value: _isChecked,
      onChanged: (newValue) {
        setState(() {
          _isChecked = newValue!;
          // Implement logic for remembering user
        });
      },
    );
  }
}