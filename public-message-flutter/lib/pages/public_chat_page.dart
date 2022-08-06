import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_public_message/services/chat_service.dart';
import 'package:flutter_public_message/widgets/message_widget.dart';

class PublicChatPage extends StatefulWidget {
  const PublicChatPage({Key? key}) : super(key: key);

  @override
  State<PublicChatPage> createState() => _PublicChatPageState();
}

class _PublicChatPageState extends State<PublicChatPage> {
  int index = 2;

  final List<Map<String, dynamic>> _chatMessages = [];

  List<String> pageRoute = [
    "/public-message",
    "/secret-message",
    "/public-chat",
    "/group-chat"
  ];

  void changeMenu(int num) {
    if (num != 2) {
      setState(() {
        index = num;
        Navigator.pushReplacementNamed(context, pageRoute[num]);
      });
    }
  }

  final chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Public Chat"),
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => changeMenu(value),
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.message, color: Colors.blue),
                label: "Message"),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock, color: Colors.blue), label: "Secret"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble, color: Colors.blue),
                label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.group, color: Colors.blue), label: "Group"),
          ],
          currentIndex: index,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 3,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<Map<String, dynamic>>(
                    stream: chatService.getAllChat(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        //_chatMessages.removeWhere((element) => true);
                        
                        if (snapshot.data!["id"] != null) {
                          //log(snapshot.data!["message"]);
                          if((_chatMessages.length-1) <= snapshot.data!["id"]){
                            _chatMessages.add(snapshot.data!);
                          }
                        }


                        return ListView.builder(
                          itemCount: _chatMessages.length,
                          itemBuilder: (context, i) => Text(
                              "${_chatMessages[i]["username"]}: ${_chatMessages[i]["content"]}"),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
              ),
              // Expanded(
              //   child: FutureBuilder<List<Map<String, dynamic>>>(
              //     future: chatService.getAllChat(),
              //     builder: (context, snapshot) =>
              //         snapshot.connectionState == ConnectionState.waiting
              //             ? const CircularProgressIndicator()
              //             : ListView.builder(
              //                 itemCount: snapshot.data!.length,
              //                 itemBuilder: (context, i) => Text("${snapshot.data![i]["username"]}: ${snapshot.data![i]["content"]}"),
              //               ),
              //   ),
              // ),
              MessageWidget()
            ],
          ),
        ));
  }
}
