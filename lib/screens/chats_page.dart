import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:whatsapp_ui_clone/data/data.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              userData[index].userName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(userData[index].lastMessage.toString()),
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/' + userData[index].userImage),
              radius: context.mediumValue - context.lowValue,
              
            ),
            trailing: Text(userData[index].lastMessageTime),
            onTap: () {},
          );
        });
  }
}
