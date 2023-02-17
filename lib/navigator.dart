import 'package:flutter/material.dart';
import 'package:reddit/screens//chat.dart';
import 'package:reddit/screens/create.dart';
import 'package:reddit/screens/discover.dart';
import 'package:reddit/screens/home.dart';
import 'package:reddit/screens/inbox.dart';

class Navigator extends StatefulWidget {
  const Navigator({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Navigator();
  }
}

class _Navigator extends State<Navigator> {
  int selectedTab = 0;

  final List<Widget> childrenWidgets = [
    const Home(),
    const Discover(),
    const Create(),
    const Chat(),
    const Inbox(),
  ];

  void onTapTapped(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childrenWidgets[selectedTab],
      // bottomNavigationBar: Theme(
      //   data: Theme.of(context).copyWith(
      //     canvasColor: Colors.white,
      //     primaryColor: Colors.deepPurpleAccent
      //   ),
      //   child: BottomNavigationBar(
      //     onTap: onTapTapped,
      //     items: const [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home),
      //           label: "Home"
      //       ),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.add),
      //           label: "Test"
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}