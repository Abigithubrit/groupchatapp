import 'package:chatapp/page/calls.dart';
import 'package:chatapp/page/chats.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _selectedindex = 0;
void _navigate(int index){
  setState(() {
    _selectedindex = index;
  });
}
final List pages = [
 Chats(),
 Calls(),
 
];

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedindex],
       bottomNavigationBar: BottomNavigationBar(
currentIndex: _selectedindex,
onTap: _navigate,
selectedItemColor: Colors.blue,
unselectedItemColor: Colors.grey.shade500,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.chat),
        label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.call),
        label: "Calls"),
       
      ],
    ),
    );
  }
}