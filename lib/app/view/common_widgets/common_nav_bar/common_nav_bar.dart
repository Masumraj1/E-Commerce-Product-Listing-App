import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  // List of pages for navigation
  final List<Widget> _pages = [
    Center(child: Text('Page 1', style: TextStyle(fontSize: 30, color: Colors.white))),
    Center(child: Text('Page 2', style: TextStyle(fontSize: 30, color: Colors.white))),
    Center(child: Text('Page 3', style: TextStyle(fontSize: 30, color: Colors.white))),
    Center(child: Text('Page 4', style: TextStyle(fontSize: 30, color: Colors.white))),
    Center(child: Text('Page 5', style: TextStyle(fontSize: 30, color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        items: <Widget>[
          Icon(Icons.add, size: 30, color: _page == 0 ? Colors.white : Colors.blueAccent),
          Icon(Icons.list, size: 30, color: _page == 1 ? Colors.white : Colors.blueAccent),
          Icon(Icons.compare_arrows, size: 30, color: _page == 2 ? Colors.white : Colors.blueAccent), // Page 3 icon
          Icon(Icons.call_split, size: 30, color: _page == 3 ? Colors.white : Colors.blueAccent),
          Icon(Icons.perm_identity, size: 30, color: _page == 4 ? Colors.white : Colors.blueAccent),
        ],
        color: Colors.grey,
        buttonBackgroundColor: Colors.grey,
        backgroundColor: _page == 2 ? Colors.white : Colors.white, // Always show curved background at index 2
        animationCurve: Curves.easeInOut,
        // Only apply animation on index 2
        animationDuration:  Duration(milliseconds: 600), // Apply animation only for index 2
        onTap: (index) {
          setState(() {
            // When index is 2, keep it selected and show curved background
            if (index == 2) {
              _page = 2;
            } else {
              _page = index;
            }
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _pages[_page], // Display the selected page
    );
  }
}
