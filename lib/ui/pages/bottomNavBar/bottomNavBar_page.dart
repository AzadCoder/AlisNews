//Core Dart and Flutter
import 'package:flutter/material.dart';
//Pages
import '../../pages/bookmark/bookmark_page.dart';
import '../../pages/home/home_page.dart';
import '../../pages/search/search_page.dart';

class ButtonNavBarPage extends StatefulWidget {
  @override
  _ButtonNavBarPageState createState() => _ButtonNavBarPageState();
}

class _ButtonNavBarPageState extends State<ButtonNavBarPage> {
  //Selected page index
  int _pageIndex = 0;
  //List of pages with icon and title
  List<Map<String, dynamic>> _pages = [
    {
      "title": "Home",
      "icon": Icons.home,
      "page": HomePage(),
    },
    {
      "title": "Search",
      "icon": Icons.search,
      "page": SearchPage(),
    },
    // {
    //   "title": "Bookmark",
    //   "icon": Icons.bookmark_border,
    //   "page": BookmarkPage(),
    // },
    // {
    //   "title": "Settings",
    //   "icon": Icons.settings,
    //   "page": SettingsPage(),
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Set home page by _pageIndex variable
      body: _pages[_pageIndex]["page"],
      //Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor,
              offset: Offset(0, -5),
              spreadRadius: 10,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 10,
          //Generating items by _pages List
          items: _pages.map((page) {
            return BottomNavigationBarItem(
              icon: Icon(page["icon"]),
              label: "",
            );
          }).toList(),
          type: BottomNavigationBarType.fixed,
          //Hide labels
          showSelectedLabels: false,
          showUnselectedLabels: false,
          //currentIndex
          currentIndex: _pageIndex,
          //onTap change the index
          onTap: (index) => _onItemTapped(index),
          //Styles for button nav bar
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }
}
