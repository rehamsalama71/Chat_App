import 'package:flutter/material.dart'; 
 
class CustomButton extends StatelessWidget { 
  CustomButton({this.ontap,required this.text}); 
  VoidCallback? ontap; 
  String text; 
  @override 
  Widget build(BuildContext context) { 
    return GestureDetector( 
      onTap: ontap, 
      child: Container( 
        decoration: BoxDecoration( 
          color: Colors.white, 
          borderRadius: BorderRadius.circular(8), 
        ), 
        width: double.infinity, 
        height: 60, 
        child: Center(child: Text(text)), 
      ), 
    ); 
  } 
} 
