import 'package:flutter/material.dart';

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
              text: "Camaera",
              icon: Icon(Icons.camera),
            ),
            Tab(
              text: "Chat",
              icon: Icon(Icons.camera),
            ),
            Tab(
              text: "Status",
              icon: Icon(Icons.camera),
            ),
            Tab(
              text: "Calls",
              icon: Icon(Icons.camera),
            ),
          ]),
        ),
      ),
    );
  }
}
