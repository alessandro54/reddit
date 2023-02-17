import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NavBar();
  }
}

class _NavBar extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 160.0,
        child: Stack(
          children: [
            Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              child: const Center(
                child: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}