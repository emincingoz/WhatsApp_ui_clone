import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/screens/whatsapp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      home: WhatsappWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
