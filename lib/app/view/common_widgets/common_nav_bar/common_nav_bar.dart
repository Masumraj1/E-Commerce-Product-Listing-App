// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
//
// class StylishBottomNav extends StatefulWidget {
//   const StylishBottomNav({super.key});
//
//   @override
//   State<StylishBottomNav> createState() => _StylishBottomNavState();
// }
//
// class _StylishBottomNavState extends State<StylishBottomNav> {
//   int selected = 0;
//   final PageController _pageController = PageController();
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             selected = index;
//           });
//         },
//         children: const [
//           Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
//           Center(child: Text('Favorites Page', style: TextStyle(fontSize: 24))),
//           Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
//         ],
//       ),
//       bottomNavigationBar: StylishBottomBar(
//         option: AnimatedBarOptions(
//           iconStyle: IconStyle.animated,
//         ),
//         items: [
//           BottomBarItem(
//             icon: const Icon(Icons.home_outlined),
//             selectedIcon: const Icon(Icons.home),
//             selectedColor: Colors.blue,
//             unSelectedColor: Colors.grey,
//             title: const Text('Home'),
//           ),
//           BottomBarItem(
//             icon: const Icon(Icons.favorite_border),
//             selectedIcon: const Icon(Icons.favorite),
//             selectedColor: Colors.red,
//             title: const Text('Favorites'),
//           ),
//           BottomBarItem(
//             icon: const Icon(Icons.person_outline),
//             selectedIcon: const Icon(Icons.person),
//             selectedColor: Colors.deepPurple,
//             title: const Text('Profile'),
//           ),
//         ],
//         hasNotch: true,
//         fabLocation: StylishBarFabLocation.center,
//         currentIndex: selected,
//         notchStyle: NotchStyle.circle,
//         onTap: (index) {
//           if (index == selected) return;
//           _pageController.jumpToPage(index);
//           setState(() {
//             selected = index;
//           });
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: Colors.white,
//         child: const Icon(
//           CupertinoIcons.heart_fill,
//           color: Colors.red,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
