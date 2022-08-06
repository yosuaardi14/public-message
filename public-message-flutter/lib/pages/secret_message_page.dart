import 'package:flutter/material.dart';
import 'package:flutter_public_message/dialogs/message_dialog.dart';
import 'package:flutter_public_message/services/message_service.dart';

class SecretMessagePage extends StatefulWidget {
  const SecretMessagePage({Key? key}) : super(key: key);

  @override
  State<SecretMessagePage> createState() => _SecretMessagePageState();
}

class _SecretMessagePageState extends State<SecretMessagePage> {
  int index = 1;

  List<String> pageRoute = [
    "/public-message",
    "/secret-message",
    "/public-chat",
    "/group-chat"
  ];

  void changeMenu(int num) {
    if (num != 1) {
      setState(() {
        index = num;
        Navigator.pushReplacementNamed(context, pageRoute[num]);
      });
    }
  }

  void sendMessage() async {
    bool status = await messageService.sendSecretMessage(
        messageController.text, passController.text);
    if (status) {
      messageController.text = "";
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(status ? "Success!" : "Failed to Send Message!"),
      ),
    );
  }

  final messageController = TextEditingController();
  final passController = TextEditingController();

  final messageService = MessageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secret Message"),
        automaticallyImplyLeading: false,
      ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Create a Secret Message",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: messageController,
              maxLines: 5,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
                onPressed: sendMessage, child: const Text("Share Now")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have a link?"),
                TextButton(onPressed: () {
                  showDialog(context: context, builder: (context) => const MessageDialog(mode: 1));
                }, child: const Text("Click here"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
