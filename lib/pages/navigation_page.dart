import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPage();
}

class _NavigationPage extends State<NavigationPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    const HomePage(),
    Container(color: Colors.teal),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        physics: const BouncingScrollPhysics(),
        children: _pages,
      ),
      //
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, -2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
            gap: 8,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.green,
            padding: const EdgeInsets.all(10),
            tabs: [
              GButton(
                  icon: MdiIcons.homeSearchOutline,
                  iconColor: Colors.black,
                  text: "Home"),
              GButton(
                  icon: MdiIcons.lightningBolt,
                  iconColor: Colors.black,
                  text: "Contest"),
              GButton(
                  icon: MdiIcons.bookOpenOutline,
                  iconColor: Colors.black,
                  text: "Revise"),
              GButton(
                  icon: MdiIcons.accountOutline,
                  iconColor: Colors.black,
                  text: "Profile")
            ],
          ),
        ),
      ),
    );
  }
}
