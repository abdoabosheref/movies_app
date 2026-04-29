import 'package:flutter/material.dart';

class ProfileDefaultTabController extends StatelessWidget {
  const ProfileDefaultTabController({super.key});
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];
  static const List<Widget> TABS = <Widget>[
  Center(child: Text('email'),),Center(child: Text('email'),),
  ];
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(length: 2, child:
    Column(
      children: [
        TabBar(tabs: myTabs),
        TabBarView(children: TABS)
      ],
    ));
  }
}
