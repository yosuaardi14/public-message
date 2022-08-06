import 'dart:convert';

import 'package:http/http.dart' as http;

class MessageService {
  static final MessageService _messageService = MessageService._internal();
  factory MessageService() {
    return _messageService;
  }
  MessageService._internal();

  final baseUrl = "http://localhost:3000/message";

  // GET	/message		mengambil semua message
  void getAllMessage() async {
    final url = Uri.parse(baseUrl);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  // GET	/message/:id		mengambil message berdasarkan id
  Future<String> getMessageById(String id, [String password = ""]) async {
    final url = Uri.parse(baseUrl + "/$id");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body)["values"][0]
          ["content"];
    }
    return "Mesage not found!";
  }

  // POST	/message/secret		insert secret message (pake password)
  Future<bool> sendSecretMessage(String message, String pass) async {
    final url = Uri.parse(baseUrl + "/secret");
    var response =
        await http.post(url, body: {"content": message, "password": pass});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  // POST 	/message/public		insert public message (tanpa password)
  Future<bool> sendPublicMessage(String message) async {
    final url = Uri.parse(baseUrl + "/public");
    var response = await http.post(url, body: {"content": message});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  // PUT 	/message/:id		update
  void updateMessage() {}

  // DELETE	/message/:id		delete
  void deleteMessage() {}
}
