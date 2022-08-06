import 'package:flutter/material.dart';
import 'package:flutter_public_message/services/chat_service.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({Key? key}) : super(key: key);

  final messageController = TextEditingController();

  final chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFormField(
            controller: messageController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () async{
              await chatService.sendChat("test", messageController.text);
              messageController.text = "";
            },
            icon: const Icon(Icons.send),
            label: const Text("Send"),
          ),
        )
      ],
    );
  }
}
