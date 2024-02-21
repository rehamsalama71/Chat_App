
import 'package:chat_app/const.dart';
import 'package:chat_app/models/message_model.dart';

import 'package:flutter/material.dart'; 
 
class ChatBubble extends StatelessWidget { 
    const ChatBubble({ 
    super.key, 
    required this.message 
  }); 
  final Message message; 
  @override 
  Widget build(BuildContext context) { 
    return Align( 
      alignment: Alignment.centerLeft, 
      child: Container( 
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), 
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32), 
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.only( 
            topLeft: Radius.circular(32), 
            topRight: Radius.circular(32), 
            bottomRight: Radius.circular(32), 
          ), 
          color: kprimaryColor, 
        ), 
        child: Text( 
          message.message, 
          style: TextStyle(color: Colors.white), 
        ), 
      ), 
    ); 
  } 
} 
 
class ChatBubbleForFriend extends StatelessWidget { 
    const ChatBubbleForFriend({ 
    super.key, 
    required this.message 
  }); 
  final Message message; 
  @override 
  Widget build(BuildContext context) { 
    return Align( 
      alignment: Alignment.centerRight, 
      child: Container( 
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), 
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32), 
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.only( 
            topLeft: Radius.circular(32), 
            topRight: Radius.circular(32), 
            bottomLeft: Radius.circular(32), 
          ), 
          color: Color(0xff006D84), 
        ), 
        child: Text( 
          message.message, 
          style: TextStyle(color: Colors.white), 
        ), 
      ), 
    ); 
  } 
}
