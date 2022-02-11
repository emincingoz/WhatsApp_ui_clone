import 'package:whatsapp_ui_clone/utils/call_type_enum.dart';

class User {
  String userName;
  String userImage;
  String lastMessage;
  String lastMessageTime;
  int? statusCount;
  CallType? callType;

  User(this.userName, this.userImage, this.lastMessage, this.lastMessageTime,
      this.statusCount, this.callType);
}
