import 'package:flutter/material.dart';
import 'package:flutter_course/chat_app/chat_screen/chat_screen.dart';
import 'package:flutter_course/chat_app/chats_list_screen/model/Chat.dart';
import 'package:flutter_course/chat_app/chats_list_screen/ui/components/chat_card.dart';
import 'package:flutter_course/chat_app/chats_list_screen/ui/components/fill_outline_button.dart';

class ChatsBody extends StatelessWidget {
  const ChatsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          color: Colors.green,
          child: Row(
            children: [
              FillOutlineButton(
                press: () {},
                text: "Recent Message",
                isFilled: true,
              ),
              SizedBox(
                width: 20.0,
              ),
              FillOutlineButton(
                press: () {},
                text: "Active",
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
            child:
                ListView.builder(
                  itemCount: chatsData.length,
                    itemBuilder: (context, index) => ChatCard(
                      chat: chatsData[index],
                        press: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen())),
                    )))
      ],
    );
  }
}
