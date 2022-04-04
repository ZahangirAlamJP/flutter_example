import 'package:flutter/material.dart';

class WhatsappMainPage extends StatefulWidget {
  const WhatsappMainPage({ Key? key }) : super(key: key);

  @override
  State<WhatsappMainPage> createState() => _WhatsappMainPageState();
}

class _WhatsappMainPageState extends State<WhatsappMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff075e55),
        title: Text('Whatsapp'),
        actions: [
          PopupMenuButton(itemBuilder: (_) {
            return [
              PopupMenuItem(child: Text("setting")),
               PopupMenuItem(child: Text("setting")),
                PopupMenuItem(child: Text("setting")),
                 PopupMenuItem(child: Text("setting")),
            ];
          })
        ],
      ),
    );
  }
}
