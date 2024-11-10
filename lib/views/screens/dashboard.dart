import 'package:flutter/material.dart';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/controllers/home_controller.dart';
import 'package:pantry/views/screens/donate.dart';
import 'package:pantry/views/screens/home.dart';
import 'package:pantry/views/screens/profile.dart';
import 'package:pantry/views/widgets/logo.dart';

Homecontroller homeController = Get.put(Homecontroller());

const List <BottomNavigationBarItem> menus = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(icon: Icon(Icons.add),
  label: 'Donate'),
  BottomNavigationBarItem(icon: Icon(Icons.person),
  label: 'Profile')
];

List screens  = [const Home(), const Donate(), const Profile()];

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text('Welcome User'),
        foregroundColor: white,
        toolbarHeight: 80.0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: white,
        ),
        child: Obx(() => screens[homeController.selectedPage.value]),
      ),
     bottomNavigationBar: BottomNavigationBar(
        items: menus,
        backgroundColor: primary,
        selectedItemColor: white,
        unselectedItemColor: secondary,
        currentIndex: homeController.selectedPage.value,
        onTap: (index) {
          homeController.updateSelectedPage(index);
        },
     ),
    );
 ;
  }
}