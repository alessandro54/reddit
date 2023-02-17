import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LayoutState();
  }
}

class _LayoutState extends State<Layout> {
  final Color backgroundColor = const Color(0xFF000000);
  var isVisible = false;
  late double screenHeight, screenWidth;
  var duration = const Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [leftDrawer(context), body(context)],
      ),
    );
  }

  Widget leftDrawer(context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              "Recently Visited",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ));
  }

  Widget body(context) {
    return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isVisible ? 0.8 * screenWidth : 0,
        right: isVisible ? -0.4 * screenWidth : 0,
        child: GestureDetector(
          child: Material(
            elevation: 0,
            color: Colors.brown,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            if (isVisible) {
              setState(() {
                isVisible = false;
              });
            }
          },
        )
    );
  }
}
