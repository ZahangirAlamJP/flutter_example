import 'package:flutter/material.dart';
import 'package:flutter_example/whatsapp_ui/chat_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int selectedIndex = 0;
  void GotoPages(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  List<Widget> _pages = [
    Center(child: Text("Page 1"),),
    Center(child: Text("Page 2"),),
    Center(child: Text("Page 3"),),
    ChatPage(),
    Center(child: Text("Page 5"),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex, 
        onTap: GotoPages,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
         
        ],
       ),
    
    );
  }
}