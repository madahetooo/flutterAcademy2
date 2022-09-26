import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/chat_app/chat_screen/model/chat_message.dart';
import 'package:image_picker/image_picker.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({Key? key}) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final messageController = TextEditingController();

  void initState() {
    super.initState();
    messageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Colors.grey[800],
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    messageController.text.isEmpty
                        ? IconButton(
                            onPressed: () async {
                              print("Gallay Clicked");
                              XFile? file = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              print(file!.path);

                              final message = ChatMessage(
                                messageType: ChatMessageType.image,
                                messageStatus: MessageStatus.viewed,
                                isSender: true,
                                imageUrl: file.path,
                              );

                              final storage = FirebaseStorage.instance;
                              final firestore = FirebaseFirestore.instance;
                              final user = FirebaseAuth.instance.currentUser;

                              final ref = storage.ref().child('images').child(
                                  DateTime.now().toIso8601String() + file.name);
                              await ref.putFile(File(file.path));
                              final url = await ref.getDownloadURL();
                              print(url);

                              Map<String, dynamic> document = {
                                'image': url,
                                'senderId': user?.uid,
                                'senderName': user?.displayName,
                                'senderImage': user?.photoURL,
                                'type': 1,
                                'timestamp': DateTime.now(),
                              };
                              firestore
                                  .collection('messages')
                                  .add(document)
                                  .then((value) => print(value.id));
                            },
                            icon: Icon(
                              Icons.attach_file_outlined,
                              color: Colors.grey[800],
                            ),
                          )
                        : SizedBox(),
                    messageController.text.isEmpty
                        ? SizedBox(
                            width: 5.0,
                          )
                        : SizedBox(),
                    messageController.text.isEmpty
                        ? IconButton(
                            onPressed: () async {
                              print("Camera Clicked");
                              XFile? file = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              print(file!.path);

                              final message = ChatMessage(
                                messageType: ChatMessageType.image,
                                messageStatus: MessageStatus.viewed,
                                isSender: true,
                                imageUrl: file.path,
                              );

                              final storage = FirebaseStorage.instance;
                              final firestore = FirebaseFirestore.instance;
                              final user = FirebaseAuth.instance.currentUser;

                              final ref = storage.ref().child('images').child(
                                  DateTime.now().toIso8601String() + file.name);
                              await ref.putFile(File(file.path));
                              final url = await ref.getDownloadURL();
                              print(url);

                              Map<String, dynamic> document = {
                                'image': url,
                                'senderId': user?.uid,
                                'senderName': user?.displayName,
                                'senderImage': user?.photoURL,
                                'type': 1,
                                'timestamp': DateTime.now(),
                              };
                              firestore
                                  .collection('messages')
                                  .add(document)
                                  .then((value) => print(value.id));
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.grey[800],
                            ),
                          )
                        : SizedBox(),
                    messageController.text.isNotEmpty
                        ? SizedBox(
                            width: 5.0,
                          )
                        : SizedBox(),
                    messageController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () async {
                              final user = FirebaseAuth.instance.currentUser;
                              final message = messageController.text;
                              print(message);
                              final messageDoc = {
                                'message': message,
                                'id': user!.uid,
                                'sender': user.displayName,
                                'time': DateTime.now(),
                              };
                             final doc = await FirebaseFirestore.instance.collection('messages').add(messageDoc);
                             print(doc.path);
                             print(doc.id);
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.green,
                            ))
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
