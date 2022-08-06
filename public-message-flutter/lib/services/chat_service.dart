import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ChatService {
  static final ChatService _chatService = ChatService._internal();
  factory ChatService() {
    return _chatService;
  }
  ChatService._internal();

  final baseUrl = "http://192.168.3.98:3000/chat";

  // GET	/chat		mengambil semua chat
  // Stream<List<Map<String,String>>> getAllChat() async* {
  //   final url = Uri.parse(baseUrl);
  //   var response = await http.get(url);
  //   log('Response status: ${response.statusCode}');
  //   log('Response body: ${response.body}');
  //   if (response.statusCode == 200) {
  //     yield (json.decode(response.body)["values"]as List<Map<String,String>>);
  //   }
  //   yield [];
  // }

  Stream<Map<String, dynamic>> getAllChat() async* {
    while(true){
    await Future<void>.delayed(const Duration(seconds: 3));
    final url = Uri.parse(baseUrl);
    var response = await http.get(url);
    //log('Response status: ${response.statusCode}');
    //log('Response body: ${response.body}');
    if (response.statusCode == 200) {
      for (var item in json.decode(response.body)["values"]) {
        await Future<void>.delayed(const Duration(milliseconds: 200));
        log(item.toString());
        //var temp = Map.castFrom(item);
        yield Map.castFrom(item);
        //yield ;

        //chat.add(Map.castFrom(item));
      }
      //yield chat;
    }
    // yield [];
    yield {};
    }
    // await Future<void>.delayed(const Duration(seconds: 3));
    // yield {"username": 'Trump', "content": "Hello"};

    // await Future<void>.delayed(const Duration(seconds: 3));
    // yield {"username": "Biden", "content": "Hi baby"};

    // await Future<void>.delayed(const Duration(seconds: 3));
    // yield {
    //   "username": "Trump",
    //   "content": "Would you like to have dinner with me?"
    // };

    // await Future<void>.delayed(const Duration(seconds: 3));
    // yield {
    //   "username": "Biden",
    //   "content": "Great. I am very happy to accompany you."
    // };

    // await Future<void>.delayed(const Duration(seconds: 3));
    // yield {"username": "Trump", "content": "Nice. I love you, my honney!"};
  }

  // Future<List<Map<String,dynamic>>> getAllChat() async {
  //   final url = Uri.parse(baseUrl);
  //   var response = await http.get(url);
  //   log('Response status: ${response.statusCode}');
  //   log('Response body: ${response.body}');
  //   if (response.statusCode == 200) {
  //     List<Map<String,dynamic>> chat = [];
  //     for (var item in json.decode(response.body)["values"]) {
  //       chat.add(Map.castFrom(item));
  //     }
  //     return chat;
  //   }
  //   return [];
  // }

  // GET	/chat/:id		mengambil chat berdasarkan id
  Future<String> getChatById(String id, [String password = ""]) async {
    final url = Uri.parse(baseUrl + "/$id");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body)["values"][0]["content"];
    }
    return "Mesage not found!";
  }

  // POST	/chat/secret		insert secret chat (pake password)
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

  // POST 	/chat	insert public message (tanpa password)
  Future<bool> sendChat(String username, String message) async {
    final url = Uri.parse(baseUrl);
    var response =
        await http.post(url, body: {"username": username, "content": message});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
