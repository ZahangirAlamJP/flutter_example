import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ListTile(
          leading: CircleAvatar(),
          title: Text("Zahangir Alam"),
          subtitle: Text("how are you?"),
          trailing: Icon(Icons.check),
        )
      ],)
    );
  }
}