import 'package:flutter/material.dart';
import 'package:personal_village/utility/get_it_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:personal_village/login/bloc/login_bloc.dart';

import 'package:personal_village/values/constants.dart';
import 'package:personal_village/values/routes.dart';



class Chat {
  final String recipientName;
  final String lastMessage;

  Chat({required this.recipientName, required this.lastMessage});
}

class ChatScreen extends StatelessWidget {
  final List<Chat> chats = [
  Chat(recipientName: 'John', lastMessage: 'Hello, how are you?'),
  Chat(recipientName: 'Marry', lastMessage: 'Meeting at 3 PM?'),
  Chat(recipientName: 'Sara', lastMessage: 'Dont forget the groceries!'),
  // Add more chat items for other contacts
  ];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text('Chats'),
    backgroundColor: Colors.orange,

  ),
  body: ListView.builder(
  itemCount: chats.length,
  itemBuilder: (context, index) {
  final chat = chats[index];
  return ChatItem(chat: chat, onTap: () {
  // Navigate to the private chat page with the selected contact
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) =>  PrivateChatScreen(recipientName: chat.recipientName),
  ),
  );

  });
  },
  ),
  );
  }
}

class ChatItem extends StatelessWidget {
  final Chat chat;
  final VoidCallback onTap;

  ChatItem({required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.asset(
          Avatarlogo, // Change this to the path of your image asset

        ),
        backgroundImage: AssetImage('path_to_avatar_image.png'),
        // Add the recipient's profile picture here
        // backgroundImage: AssetImage('path_to_avatar_image.png'),
      ),
      title: Text(chat.recipientName),
      subtitle: Text(chat.lastMessage),
      onTap: onTap,
    );
  }
}

class PrivateChatScreen extends StatelessWidget {
  final String recipientName;

  PrivateChatScreen({required this.recipientName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(recipientName),
      ),
      // Add chat messages and input field for the private chat screen
      body: Center(
        child: Text('Private chat with $recipientName'),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}
