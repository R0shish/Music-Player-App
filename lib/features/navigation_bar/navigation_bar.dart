import 'dart:ui';

import 'package:flutter/material.dart';
import '../homescreen/presentation/homescreen.dart';

import '../../constants/color_constant.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  final List<Widget> screens = const <Widget>[
    Homescreen(),
    Homescreen(),
    Homescreen(),
    Homescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: IndexedStack(index: 0, children: screens),
        bottomNavigationBar: ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 25.0,
                  sigmaY: 25.0,
                ),
                child: BottomNavigationBar(
                    elevation: 1,
                    iconSize: 30,
                    selectedFontSize: 15,
                    unselectedFontSize: 15,
                    backgroundColor: AppColor.black.withOpacity(0.3),
                    selectedItemColor: AppColor.primary,
                    unselectedItemColor: AppColor.lightGrey,
                    currentIndex: 0,
                    onTap: (index) => 0,
                    type: BottomNavigationBarType.fixed,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.search_outlined), label: "Explore"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.bookmark_outline),
                          label: "Playlist"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person_outline), label: "Account"),
                    ]))));
  }
}
