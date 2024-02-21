import 'package:chat_app/const.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_buble.dart';

import 'package:flutter/material.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart'; 
 
class ChatPage extends StatelessWidget { 
  static String id = 'ChatPage'; 
  CollectionReference messages = 
      FirebaseFirestore.instance.collection(kMessagesCollections); 
  TextEditingController controller = TextEditingController(); 
  final _controller = ScrollController(); 
  @override 
  Widget build(BuildContext context) { 
    var email = ModalRoute.of(context)!.settings.arguments ; 
    return StreamBuilder<QuerySnapshot>( 
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(), 
        builder: (context, snapshot) { 
          if (snapshot.hasData) { 
            List<Message> messagesList = []; 
            for (int i = 0; i < snapshot.data!.docs.length; i++) { 
              messagesList.add(Message.fromJson(snapshot.data!.docs[i])); 
            } 
            return Scaffold( 
              appBar: AppBar( 
                automaticallyImplyLeading: false, 
                backgroundColor: kprimaryColor, 
                title: Row( 
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [ 
                    Image.asset( 
                      kLogo, 
                      height: 50, 
                    ), 
                    Text( 
                      'Chat', 
                      style: TextStyle(color: Colors.white), 
                    ) 
                  ], 
                ), 
                centerTitle: true, 
              ), 
              body: Column( 
                children: [ 
                  Expanded( 
                    child: ListView.builder( 
                      reverse: true, 
                      controller: _controller, 
                      itemCount: messagesList.length, 
                      itemBuilder: (context, index) { 
                        return messagesList[index].id==email ? ChatBubble( 
                          message: messagesList[index], 
                        ): ChatBubbleForFriend(message: messagesList[index]); 
                      }, 
                    ), 
                  ), 
                  Padding( 
                    padding: EdgeInsets.all(16), 
                    child: TextField( 
                      controller: controller, 
                      onSubmitted: (data) { 
                        messages.add({ 
                          kMessage: data, 
                          kCreatedAt: DateTime.now(), 
                          'id':email, 
                        }); 
                        controller.clear(); 
                        _controller.animateTo(0, 
                            duration: Duration(seconds: 1), 
                            curve: Curves.fastOutSlowIn); 
                      }, 
                      decoration: InputDecoration( 
                        hintText: 'Send Message', 
                        suffixIcon: Icon( 
                          Icons.send, 
                          color: kprimaryColor, 
                        ), 
                        border: OutlineInputBorder( 
                          borderRadius: BorderRadius.circular(16), 
                        ), 
                        enabledBorder: OutlineInputBorder( 
                          borderRadius: BorderRadius.circular(16), 
                          borderSide: BorderSide( 
                            color: kprimaryColor, 
                          ), 
                        ), 
                      ), 
                    ), 
                  ) 
                ], 
              ), 
            ); 
          } else { 
            return Center( 
        child: CircularProgressIndicator(),); 
          } 
        }); 
  } 
   
} 