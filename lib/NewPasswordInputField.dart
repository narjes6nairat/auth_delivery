import 'package:flutter/material.dart';

class NewPasswordInputField extends StatelessWidget {
  const NewPasswordInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Enter New Password',
        border: OutlineInputBorder(),
      ),
      obscureText: true,
        //maxLength: 6,//هذا نفس بس يلزم ادخال 6 حروف فقط لا اكثر ولا اقل
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              value.trim().length<6//هذا الشرط لتحديد الطول
          ) {
            return "Error Password";//اعملي الرسالة التي تشتي يا نرجس هنا
          }
          return value;
        }// Hide the entered text for passwords
      // Validation and other properties as needed
    );
  }
}
