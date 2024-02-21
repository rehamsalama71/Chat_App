import 'package:chat_app/const.dart';
import 'package:chat_app/helper/show_snak_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/custom_buttom.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
 
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:flutter/material.dart'; 
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; 
 
class RegisterPage extends StatefulWidget { 
  RegisterPage({super.key}); 
  static String id = 'RegisterPage'; 
 
  @override 
  State<RegisterPage> createState() => _RegisterPageState(); 
} 
 
class _RegisterPageState extends State<RegisterPage> { 
  String? email;
   String? password; 
 
  bool isLoading = false; 
 
  GlobalKey<FormState> formKey = GlobalKey(); 
 
  @override 
  Widget build(BuildContext context) { 
    return ModalProgressHUD( 
      inAsyncCall: isLoading, 
      child: Scaffold( 
        backgroundColor: kprimaryColor, 
        body: Padding( 
          padding: EdgeInsets.symmetric(horizontal: 8), 
          child: Form( 
            key: formKey, 
            child: ListView( 
              children: [ 
                const SizedBox( 
                  height: 75, 
                ), 
                Image.asset( 
                  'assets/images/scholar.png', 
                  height: 100, 
                ), 
                const Row( 
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [ 
                    Text( 
                      'Scholar Chat', 
                      style: TextStyle( 
                        fontSize: 32, 
                        color: Colors.white, 
                        fontFamily: 'Pacifico', 
                      ), 
                    ), 
                  ], 
                ), 
                SizedBox( 
                  height: 75, 
                ), 
                Row( 
                  children: [ 
                    Text( 
                      'Register', 
                      style: TextStyle( 
                        fontSize: 24, 
                        color: Colors.white, 
                      ), 
                    ), 
                  ], 
                ), 
                const SizedBox( 
                  height: 20, 
                ), 
                CustomTextFormField( 
                  onChanged: (data) { 
                    email = data; 
                  }, 
                  hintText: 'Email', 
                ), 
                const SizedBox( 
                  height: 10, 
                ), 
                CustomTextFormField( 
                  onChanged: (data) { 
                    password = data; 
                  }, 
                  hintText: 'Password', 
                ), 
                const SizedBox( 
                  height: 20, 
                ), 
                CustomButton( 
                  ontap: () async { 
                    if (formKey.currentState!.validate()) { 
                      isLoading = true; 
                      setState(() {}); 
                      try { 
                        var auth = FirebaseAuth.instance; 
                        await registerUser(auth); 
                        Navigator.pushNamed(context, ChatPage.id,arguments: 
email); 
                      } on FirebaseAuthException catch (e) { 
                        if (e.code == 'weak-password') { 
                          showSnackBar(context, 'Weak Password'); 
                        } else if (e.code == 'email-already-in-use') { 
                          showSnackBar(context, 'this account already exists'); 
                        } 
                      } catch (e) { 
                        showSnackBar(context, 'there was an error'); 
                      } 
                      isLoading = false; 
                      setState(() {}); 
                    } else {} 
                  }, 
                  text: 'Register', 
                ), 
                const SizedBox( 
                  height: 10, 
                ), 
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [ 
                    Text( 
                      'Already have an account!', 
                      style: TextStyle( 
                        color: Colors.white, 
                      ), 
                    ), 
                    GestureDetector( 
                      onTap: () { 
                        Navigator.pop(context); 
                      }, 
                      child: Text( 
                        '  LOGIN', 
                        style: TextStyle(color: Color(0xffC7EDE6)), 
                      ), 
                    ) 
                  ], 
                ), 
              ], 
            ), 
          ), 
        ), 
      ), 
    ); 
  } 
 
  Future<void> registerUser(FirebaseAuth auth) async { 
    UserCredential user = await auth.createUserWithEmailAndPassword( 
        email: email!, password: password!); 
  } 
}