import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Layout extends StatefulWidget {
  final Widget child, topBar;

  const Layout({Key? key, required this.topBar, required this.child})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LayoutState();
  }
}

class _LayoutState extends State<Layout> {
  final Color backgroundColor = const Color(0xFF000000);
  late double screenHeight, screenWidth;
  late Map<String, double> positions;
  late double drawerWidth;

  @override
  void initState() {
    super.initState();
    screenWidth = (window.physicalSize.shortestSide / window.devicePixelRatio);
    screenHeight = (window.physicalSize.longestSide / window.devicePixelRatio);
    drawerWidth = screenWidth * 0.78;
    positions = {"left": -drawerWidth, "center": 0.0, "right": screenWidth};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Section(
                  width: drawerWidth,
                  position: positions["left"]!,
                  child: leftDrawer(context)),
              Section(
                width: screenWidth,
                position: positions["center"]!,
                child: body(context, widget.topBar, widget.child),
              ),
              Section(
                  width: drawerWidth,
                  position: positions["right"]!,
                  child: rightDrawer(context))
            ],
          ),
        ));
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
              "Left Drawer",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ));
  }

  Widget rightDrawer(context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              "Right drawer",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ));
  }

  Widget body(context, topBar, child) {
    return GestureDetector(
      child: Material(
        elevation: 0,
        color: Color.fromARGB(255, 174, 247, 247),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 32,
                      weight: 10,
                    ),
                    onTap: () {
                      setState(() {
                        positions = {
                          "left": 0.0,
                          "center": drawerWidth,
                          "right": screenWidth
                        };
                      });
                    },
                  ),
                  Expanded(
                    child: Container(color: Colors.blue, child: topBar),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          positions = {
                            "left": -2 * drawerWidth,
                            "center": -drawerWidth,
                            "right": screenWidth - drawerWidth
                          };
                        });
                      },
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('images/profile_icon.png'),
                            backgroundColor: Colors.transparent,
                          ),
                          Positioned(
                            bottom: -2,
                            child: Container(
                              width: 13.0,
                              height: 13.0,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                            ),
                          )
                        ],
                      )),
                ],
              ),
              child
            ],
          ),
        ),
      ),
      onTap: () {
        setState(() {
          positions = {
            "left": -drawerWidth,
            "center": 0.0,
            "right": drawerWidth
          };
        });
      },
    );
  }
}

class Section extends StatelessWidget {
  final double width, position;
  final Widget child;

  const Section({
    Key? key,
    required this.width,
    required this.position,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      height: MediaQuery.of(context).size.height,
      width: width,
      left: position,
      child: child,
    );
  }
}
