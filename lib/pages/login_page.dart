import 'package:chat_app/const.dart';
import 'package:chat_app/helper/show_snak_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_buttom.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:flutter/material.dart'; 
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; 
 
class LoginPage extends StatefulWidget { 
  const LoginPage({super.key}); 
  static String id = 'LoginPage'; 
 
  @override 
  State<LoginPage> createState() => _LoginPageState(); 
} 
 
class _LoginPageState extends State<LoginPage> { 
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
          padding: const EdgeInsets.symmetric(horizontal: 8), 
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
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [ 
                    const Text( 
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
                      'LOGIN', 
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
                  obsecureText: true, 
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
                        await loginUser(auth); 
                        Navigator.pushNamed(context, ChatPage.id,arguments:email 
); 
                      } on FirebaseAuthException catch (e) { 
                        if (e.code == 'user-not-found') { 
                          showSnackBar( 
                              context, 'No user found for that email.'); 
                        } else if (e.code == 'wrong-password') { 
                          showSnackBar(context, 
                              'Wrong password provided for that user.'); 
                        } 
                      } catch (e) { 
                        showSnackBar(context, 'there was an error'); 
                      } 
                      isLoading = false; 
                      setState(() {}); 
                    } else {} 
                  }, 
                  text: 'LOGIN', 
                ), 
                const SizedBox( 
                  height: 10, 
                ), 
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [ 
                    Text( 
                      'don\'t have an account ?', 
                      style: TextStyle( 
                        color: Colors.white, 
                      ), 
                    ), 
                    GestureDetector( 
                      onTap: () { 
                        Navigator.pushNamed(context, RegisterPage.id); 
                      }, 
                      child: Text( 
                        '  Register', 
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
 
  Future<void> loginUser(FirebaseAuth auth) async { 
    UserCredential user = await auth.signInWithEmailAndPassword( 
        email: email!, password: password!); 
  } 
} 