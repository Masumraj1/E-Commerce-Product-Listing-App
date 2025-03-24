import 'package:flutter/material.dart';
import 'package:recipe_app/app/view/common_widgets/common_nav_bar/common_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text('data'),),
      // bottomNavigationBar: StylishBottomNav(),
    );
  }
}
