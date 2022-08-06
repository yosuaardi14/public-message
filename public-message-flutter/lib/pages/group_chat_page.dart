import 'package:flutter/material.dart';
import 'package:flutter_public_message/services/chat_service.dart';

class GroupChatPage extends StatefulWidget {
  const GroupChatPage({Key? key}) : super(key: key);

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  int index = 3;

  List<String> pageRoute = [
    "/public-message",
    "/secret-message",
    "/public-chat",
    "/group-chat"
  ];

  void changeMenu(int num) {
    if (num != 3) {
      setState(() {
        index = num;
        Navigator.pushReplacementNamed(context, pageRoute[num]);
      });
    }
  }

  final chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    chatService.getAllChat();
    return Scaffold(
      appBar: AppBar(
          title: const Text("Group Chat"), automaticallyImplyLeading: false),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => changeMenu(value),
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.message, color: Colors.blue), label: "Message"),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock, color: Colors.blue), label: "Secret"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble, color: Colors.blue), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.group, color: Colors.blue), label: "Group"),
        ],
        currentIndex: index,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 3,
      ),
      body: Container(),
    );
  }
}
