import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat.dart';
import 'package:whatsapp/models/chat.dart';
import 'package:whatsapp/ui/widgets.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildList(20),
    );
  }

  List _buildList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(ChatItemWidget(
        chat: userTest(i),
      ));
    }

    return listItems;
  }

  Chat userTest(int index) {
    return Chat(
        name: 'Peter $index',
        messageDate: 'Yesterday',
        mostRecentMessage:
            'Hi, my name is Peter Parker and Im not Spiderman, so please, call me $index');
  }
}
