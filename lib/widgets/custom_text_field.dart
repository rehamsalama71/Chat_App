import 'package:flutter/material.dart'; 
 
class CustomTextFormField extends StatelessWidget { 
  CustomTextFormField({super.key, this.hintText, 
this.onChanged,this.obsecureText=false}); 
  final String? hintText; 
  Function(String)? onChanged; 
  bool? obsecureText; 
  @override 
  Widget build(BuildContext context) { 
    return TextFormField( 
      obscureText:obsecureText! , 
      validator: (data) { 
        if (data!.isEmpty) { 
          return 'field is required'; 
        } 
      }, 
      onChanged: onChanged, 
      decoration: InputDecoration( 
        hintText: hintText, 
        hintStyle: TextStyle(color: Colors.white), 
        enabledBorder: OutlineInputBorder( 
          borderSide: BorderSide( 
            color: Colors.white, 
          ), 
        ), 
        border: OutlineInputBorder( 
          borderSide: BorderSide( 
            color: Colors.white, 
          ), 
        ), 
      ), 
    ); 
  } 
} 
