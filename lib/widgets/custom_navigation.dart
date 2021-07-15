import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomNavigations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final iuProvider = Provider.of<UiProvider>(context);
    final indexPosition = iuProvider.menuSelect;

    return BottomNavigationBar(
        onTap: (int i) => iuProvider.menuSelect = i,
        currentIndex: indexPosition,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box, color: Colors.white70,), label: 'Users'), 
          BottomNavigationBarItem(
              icon: Icon(Icons.animation, color: Colors.white70,), label: 'Animation'),
          BottomNavigationBarItem(
              icon: Icon(Icons.open_in_browser, color: Colors.white70,), label: 'Browser'),
          BottomNavigationBarItem(
              icon: Icon(Icons.not_interested_sharp, color: Colors.white70,), label: 'Menu 4'),
        ]);
  }
}
