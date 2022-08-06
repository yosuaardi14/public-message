import 'package:flutter/material.dart';
import 'package:flutter_public_message/pages/group_chat_page.dart';
import 'package:flutter_public_message/pages/public_chat_page.dart';
import 'package:flutter_public_message/pages/public_message_page.dart';
import 'package:flutter_public_message/pages/secret_message_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Public Message",
      home: PublicMessagePage(),
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: {
        "/public-chat": (context) => PublicChatPage(),
        "/public-message": (context) => PublicMessagePage(),
        "/group-chat": (context) => GroupChatPage(),
        "/secret-message": (context) => SecretMessagePage(),
      },
    );
  }
}
