import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      body: ListView(children: [
        ...List.generate(100, (index) => 
        ListTile(
          leading: CircleAvatar(child: Text("$index"),),
          title: Text("Zahangir Alam $index"),
          subtitle: Text("how are you?"),
          trailing: Icon(Icons.check),
        )
        )
      ],)
    );
  }
}