import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as httpp;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'PasswordResetScreen.dart';
import 'RecoveryButton.dart';
import 'RecoveryInputField.dart';
import 'package:auth_delivery/controller/auth/forgetpassword_controller.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});


  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  @override
  void initState() {
   loadData();
    super.initState();
  }

  static var data;
  String ?check ;
  var sendid=null;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller = Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Password Recovery'),
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
    'Forgot Password?',
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.center,
    ),
    const SizedBox(height: 20),
    TextFormField(
    decoration: const InputDecoration(
    labelText: 'Enter Registered Email',

    border: OutlineInputBorder(),

    ),
    keyboardType: TextInputType.emailAddress,
    // Validation and other properties as needed
    validator:(value){
      for(var i=0 ;i<2;i++ ){
        if(value==data['drivers'][i]['email']) {
          check=data['drivers'][i]["email"];
          sendid=data['drivers'][i]["id"];

        }
      }

    if (value == null ||
    value.isEmpty ||
    value!=check
    )
    {
    return "error email";
    }
    return 'Done';
  },
  ),
  const SizedBox(height: 16),
  RecoveryButton(
  onPressed: () async{
    data =await fetchdata();
    _formkey.currentState!.validate();
    if(sendid!=null){
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: "narjes.nairat@gmail.com",
            password: "12345678"
        );
        if(userCredential.user!.emailVerified==false) {
          FirebaseAuth.instance.currentUser!.sendEmailVerification();
          userCredential.user!.emailVerified;
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
    }
      Get.to(()=>PasswordResetScreen(id:sendid));
    }


  }),
  ],
  ),
  ),
  ),
  );
}
loadData()async{
  return await fetchdata();
}
}
fetchdata()async{
  String url= 'http://192.168.1.103/repassword/index.php?checkopration=load_email';
  final res= await httpp.post(Uri.parse(url));
  try{
    if(res.statusCode==200){
      var obj=jsonDecode(res.body);
      print(obj['drivers'][0]['email']);
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