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
            child: ListView.builder(
              itemCount: dummyChatMessages.length,
              itemBuilder: (context, index) => Message(
                message: dummyChatMessages[index],
                index: index,
              ),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
