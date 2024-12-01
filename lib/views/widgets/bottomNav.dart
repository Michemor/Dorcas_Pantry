
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/controllers/home_controller.dart';
import 'package:pantry/views/screens/home.dart';
import 'package:pantry/views/screens/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

final Homecontroller _homecontroller = Homecontroller();

class BottomNav extends StatelessWidget {
  final int currentPage;
  final Function(int) changePage;
  final List <SalomonBottomBarItem> pages;

  BottomNav({
    required this.currentPage, 
    required this.changePage,
    required this.pages});

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
        items: pages,
        currentIndex: currentPage,
        backgroundColor: primary,
        itemPadding: const EdgeInsets.all(10),
        onTap: (index) { changePage(index);},
    );
  }
}