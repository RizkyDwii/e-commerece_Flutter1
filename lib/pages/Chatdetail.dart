import 'package:flutter/material.dart';

class Chatdetail extends StatefulWidget {
  const Chatdetail({super.key, required this.contactName, required this.message});

  final String contactName;
  final String message;

  @override
  _ChatdetailState createState() => _ChatdetailState();
}

class _ChatdetailState extends State<Chatdetail> {
  final List<Map<String, String>> _messages = [
    {
      'message': 'Hi! How are you doing?',
      'time': '10:20',
      'isSender': 'false',
    },
    {
      'message': 'I\'m doing well, thank you!',
      'time': '10:21',
      'isSender': 'true',
    },
    {
      'message': 'That\'s great! Do you have time to catch up later?',
      'time': '10:22',
      'isSender': 'false',
    },
    {
      'message': 'Sure, I\'ll be free in the afternoon.',
      'time': '10:23',
      'isSender': 'true',
    },
    {
      'message': 'Perfect! Let\'s meet at 3 PM then.',
      'time': '10:24',
      'isSender': 'false',
    },
  ];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: Text(widget.contactName), 
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message['isSender'] == 'true'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: _buildChatBubble(
                    message: message['message']!,
                    isSender: message['isSender'] == 'true',
                    time: message['time']!,
                    avatarUrl: message['isSender'] == 'true'
                        ? null
                        : 'https://randomuser.me/api/portraits/men/12.jpg',
                  ),
                );
              },
            ),
          ),
          _buildMessageInput(_controller),
        ],
      ),
    );
  }

  Widget _buildChatBubble({
    required String message,
    required bool isSender,
    required String time,
    String? avatarUrl,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isSender && avatarUrl != null)
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(avatarUrl),
          ),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSender ? Colors.green[100] : Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: isSender ? const Radius.circular(12) : Radius.zero,
                bottomRight: isSender ? Radius.zero : const Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageInput(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.emoji_emotions_outlined),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  _messages.add({
                    'message': controller.text,
                    'time': TimeOfDay.now().format(context),
                    'isSender': 'true',
                  });
                });
                controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
