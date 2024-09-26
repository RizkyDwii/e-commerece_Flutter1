import 'package:flutter/material.dart';
import 'package:skl_pertama_for_real/pages/Chatdetail.dart';

class Chatpage extends StatelessWidget {
  const Chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('LitMall Chat',style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/${index + 10}.jpg',
              ),
            ),
            title: Text('Contact ${index + 1}'),
            subtitle: const Text('Hello! Aku mau pesen ini'),
            trailing: const Text('12:00 PM'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chatdetail(
                    contactName: 'Contact ${index + 1}', 
                    message: 'Hello! Aku mau pesen ini',
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}