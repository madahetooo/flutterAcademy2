import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/chat_app/chat_screen/ui/components/message_body.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builAppBar(context),
      body: MessageBody(),
    );
  }

  AppBar builAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "FlutterAcademyChatGroup",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.local_phone),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.videocam),
        ),
        IconButton(
          onPressed: ()async {
            await GoogleSignIn().signOut();
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.logout),
        ),
        SizedBox(width: 20.0,),
      ],
    );
  }
}
