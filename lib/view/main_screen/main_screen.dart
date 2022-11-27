import 'package:flutter/material.dart';
import 'package:uber_driver_app/controller/constant/color.dart';
import 'package:uber_driver_app/view/tabPages/earning_screen.dart';
import 'package:uber_driver_app/view/tabPages/home_screen.dart';
import 'package:uber_driver_app/view/tabPages/profile_screen.dart';
import 'package:uber_driver_app/view/tabPages/ratings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  int selectedIndex = 0;

  onTabClicked( int index){
    setState(() {
      selectedIndex = index;
      _tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TabBarView(
      physics: const NeverScrollableScrollPhysics(),
    controller: _tabController,
    children: const [
      HomeScreen(),
      EarningScreen(),
      RatingScreen(),
      ProfileScreen()
    ]),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTabClicked,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      unselectedItemColor: iconColor,
      selectedItemColor: primaryColor,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.star),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
      ],
    ),
    );
  }
}
