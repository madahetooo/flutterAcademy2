import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/chat_app/chat_screen/model/chat_message.dart';
import 'package:flutter_course/chat_app/chat_screen/ui/components/chat_input_field.dart';
import 'package:flutter_course/chat_app/chat_screen/ui/components/message.dart';

class MessageBody extends StatefulWidget {
  const MessageBody({Key? key}) : super(key: key);

  @override
  State<MessageBody> createState() => _MessageBodyState();
}

class _MessageBodyState extends State<MessageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: StreamBuilder<QuerySnapshot<Map>>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('timestamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data!.size <= 0) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final snapshotData = snapshot.data!;
                final size = snapshotData.size;
                List<ChatMessage> chatMessages = [];
                final user = FirebaseAuth.instance.currentUser!;
                if (user == null) {
                  Navigator.of(context).pop();
                }
                snapshot.data!.docs.forEach((element) {
                  final data = element.data();
                  ChatMessageType type;
                  ChatMessage message;
                  final senderId = data['senderId'];
                  if (data['type'] == 1) {
                    type = ChatMessageType.image;
                    message = ChatMessage(
                      messageType: type,
                      messageStatus: MessageStatus.viewed,
                      isSender: user.uid == senderId,
                      senderImage: data['senderImage'],
                      sender: data['senderName'],
                      imageUrl: data['image'],
                    );
                  } else {
                    type = ChatMessageType.text;
                    message = ChatMessage(
                      messageType: type,
                      messageStatus: MessageStatus.viewed,
                      isSender: user.uid == senderId,
                      senderImage: data['senderImage'],
                      sender: data['senderName'],
                      imageUrl: data['message'],
                    );
                  }
                  chatMessages.add(message);
                });
                return ListView.builder(
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) => Message(
                    message: chatMessages[index],
                    index: index,
                  ),
                );
              },
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
