import 'package:flutter/material.dart';
import 'package:flutter_example/whatsapp_ui/chat_page.dart';

class WhatsappMainPage extends StatefulWidget {
  const WhatsappMainPage({ Key? key }) : super(key: key);

  @override
  State<WhatsappMainPage> createState() => _WhatsappMainPageState();
}

class _WhatsappMainPageState extends State<WhatsappMainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff075e55),
          title: Text('Whatsapp'),
          actions: [
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("setting")),
                 PopupMenuItem(child: Text("setting")),
                  PopupMenuItem(child: Text("setting")),
                   PopupMenuItem(child: Text("setting")),
              ];
            }),
          ],
          bottom: TabBar(
            indicatorColor: Colors.amber,
            tabs: [
            Tab(
             
              icon: Icon(Icons.camera),
            ),
            Tab(
              text: "Chat",
             
            ),
            Tab(
              text: "Status",
   
            ),
            Tab(
              text: "Calls",
       
            ),
          ]),
        ),
        body: TabBarView(children: [
          Text("CAMERA", style: TextStyle(fontSize: 30),),
          ChatPage(),
          //Text("CHATS", style: TextStyle(fontSize: 30),),
          Text("STATUS", style: TextStyle(fontSize: 30),),
          Text("CALLS", style: TextStyle(fontSize: 30),),
        ]),
      ),
    );
  }
}
