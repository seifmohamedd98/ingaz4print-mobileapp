import 'package:flutter/material.dart';

void main() {
  runApp(Header());
}

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.yellow[700],
      toolbarHeight: 95,
      title: Image.asset(
        'images/logo.png',
        fit: BoxFit.contain,
        height: 80,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          _drawerKey.currentState.openDrawer();
        },
      ),
    );
  }
}
