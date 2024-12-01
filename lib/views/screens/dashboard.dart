import 'package:flutter/material.dart';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/controllers/home_controller.dart';
import 'package:pantry/views/screens/event.dart';
import 'package:pantry/views/screens/home.dart';
import 'package:pantry/views/screens/profile.dart';
import 'package:pantry/views/widgets/bottomNav.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

Homecontroller homeController = Get.put(Homecontroller());

//const List <BottomNavigationBarItem> menus = [
//  BottomNavigationBarItem(
//    icon: Icon(Icons.home),
//    label: 'Home',
//  ),
//  BottomNavigationBarItem(icon: Icon(Icons.add),
//  label: 'Donate'),
//  BottomNavigationBarItem(icon: Icon(Icons.person),
//  label: 'Profile')
//];

List <Widget> screens  = [
  const Home(), 
  const Event(), 
  const Profile()];

class Dashboard extends StatefulWidget {
  
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  List <SalomonBottomBarItem> pages = [
    // Home button
    SalomonBottomBarItem(
      icon: Icon(Icons.home), 
      title: Text("Home"),
      selectedColor: white,
      unselectedColor: secondary),

      // Donation button
      SalomonBottomBarItem(
        icon: Icon(Icons.ads_click_sharp), 
        title: Text("Events"),
        selectedColor: white,
        unselectedColor: secondary,
        ),
        // Profile button
      SalomonBottomBarItem(
        icon: Icon(Icons.person), 
        title: Text("Profile"),
        selectedColor: white,
        unselectedColor: secondary,
        )
  ];

  int _onItemTapped(int index){
    setState(() {
      homeController.selectedPage.value = index;
    });
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Obx(() => screens[homeController.selectedPage.value]),
     bottomNavigationBar: BottomNav(
      currentPage: homeController.selectedPage.value,
      changePage: _onItemTapped,
      pages: pages,
     )
    );
  }
}