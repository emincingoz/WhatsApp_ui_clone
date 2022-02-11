import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:whatsapp_ui_clone/constants/app_colors.dart';
import 'package:whatsapp_ui_clone/constants/app_icons.dart';
import 'package:whatsapp_ui_clone/data/data.dart';
import 'package:whatsapp_ui_clone/utils/call_type_enum.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  _CallsPageState createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
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
          leading: Padding(
            padding: const EdgeInsets.all(3.5),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/' + userData[index].userImage),
              radius: context.mediumValue - context.lowValue,
            ),
          ),
          subtitle: Text(userData[index].lastMessageTime),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              userData[index].callType == CallType.voiceCall
                  ? AppIcons.voiceCallIcon
                  : AppIcons.videoCallIcon,
              color: AppColors.appMainColor,
            ),
          ),
          onTap: () {},
        );
      },
    );
  }
}
