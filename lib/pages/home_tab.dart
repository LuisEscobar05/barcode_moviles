import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/pageViews/animation.dart';
import 'package:flutter_provider/pages/pageViews/my_app.dart';
import 'package:flutter_provider/pages/pageViews/page3.dart';
import 'package:flutter_provider/pages/pageViews/page4.dart';
import 'package:flutter_provider/providers/ui_provider.dart';
import 'package:flutter_provider/widgets/bottom_camera.dart';
import 'package:flutter_provider/widgets/custom_navigation.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Tab'),
        actions: [],
      ),
      body: HomeTabContainer(),
      bottomNavigationBar: CustomNavigations(),
      floatingActionButton: BottomCamera(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class HomeTabContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final iuProvider = Provider.of<UiProvider>(context);
    final indexPosition = iuProvider.menuSelect;

    switch (indexPosition) {
      case 0:
        return UsersView();
      case 1:
        return MyApp2();
      case 2:
        return Page3();
      case 3:
        return Page4();
      default:
        return MyApp2();
    }

  }
}
