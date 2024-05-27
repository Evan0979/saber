// chat_screen.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _queryController = TextEditingController();
  List<Map<String, String>> _messages = [];

  Future<void> _sendQuery() async {
    final apiKey = 'Your key';
    final apiUrl = 'https://api.openai.com/v1/chat/completions';

    _messages.add({'role': 'user', 'content': _queryController.text});

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'system', 'content': '你是一個樂於助人的助手。'},
          ..._messages
        ]
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      final gptResponse = jsonResponse['choices'][0]['message']['content'];

      setState(() {
        _messages.add({'role': 'assistant', 'content': gptResponse});
        _queryController.clear();
      });
    } else {
      print('API 请求失败：${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Chat Interface'),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Chat Topics',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ..._messages.map((message) {
              return ListTile(
                title: Text(
                  '${message['role'] == 'user' ? 'User' : 'GPT'}: ${message['content']}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Optionally handle the selection, e.g., show the full conversation
                },
              );
            }).toList(),
          ],
        ),
      ),
      body: Column(
        children: [
          Text(
            'Response:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _messages.map((message) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${message['role'] == 'user' ? 'User' : 'GPT'}: ${message['content']}',
                      style: TextStyle(
                        color: message['role'] == 'user' ? Colors.blue : Colors.green,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _queryController,
                    decoration: InputDecoration(
                      labelText: 'Enter your query',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _sendQuery(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendQuery,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


