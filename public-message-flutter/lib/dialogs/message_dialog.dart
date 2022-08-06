import 'package:flutter/material.dart';
import 'package:flutter_public_message/services/message_service.dart';

class MessageDialog extends StatefulWidget {
  const MessageDialog({Key? key, this.mode = 0}) : super(key: key);

  final int mode;

  @override
  State<MessageDialog> createState() => _MessageDialogState();
}

class _MessageDialogState extends State<MessageDialog> {
  final codeController = TextEditingController();

  final passController = TextEditingController();

  final messageService = MessageService();
  String message = "";

  void getMessage() async {
    message = await messageService.getMessageById(codeController.text);
    setState(() {});
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(status ? "Success!" : "Failed to Send Message!"),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Show Message"),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextFormField(
              controller: codeController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          if (widget.mode == 1)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                controller: passController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(message, maxLines: 5),
          ),
          ElevatedButton(onPressed: getMessage, child: const Text("Show"))
        ],
      ),
    );
  }
}
