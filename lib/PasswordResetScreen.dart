import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'NewPasswordInputField.dart';
import 'ResetButton.dart';

class PasswordResetScreen extends StatefulWidget {
  PasswordResetScreen({super.key, required this.id});
  final int id;
  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}
class _PasswordResetScreenState extends State<PasswordResetScreen> {
  String password='';

  bool  success=false;

  final _formkey = GlobalKey<FormState>();
  void dispose() {
    // TODO: implement dispose
    success=false;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Reset'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Reset Your Password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              buildTextFormField(),
              const SizedBox(height: 16),
              ResetButton(
                onPressed: () async{
                 _formkey.currentState!.validate();
                  if(success==true){
                    _formkey.currentState!.save();
                    await updatedata(widget.id,password);
                  }

                  // Implement password reset logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              //maxLength: 6,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length < 6 //هذا الشرط لتحديد الطول
                ) {
                  return "Error Password";
                }
                success = true;
                return null;
              },
              onSaved: (val) {
                password = val!;
              },
            );
  }

  updatedata(id,password)async{
    String url= 'http://192.168.1.103/repassword/index.php?checkopration=update_email';
    final res= await http.post(Uri.parse(url),body: {
      'id':id.toString(),
      'password':password,
    });
    try{
      if(res.statusCode==200){
        var obj=jsonDecode(res.body);
        return obj;
      }
      else
      {
        print ('error');
      }
    }
    catch(e){
      print("Error ${res.statusCode}");
    }
  }
}
