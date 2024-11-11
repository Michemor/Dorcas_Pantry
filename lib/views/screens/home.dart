
import 'package:flutter/material.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/controllers/home_controller.dart';
import 'package:pantry/views/screens/dashboard.dart';
import 'package:pantry/views/screens/donate.dart';
import 'package:pantry/views/screens/profile.dart';
import 'package:pantry/views/widgets/bottomNav.dart';
import 'package:pantry/views/widgets/nav.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: navBar(navTitle: const Text("Home")),
    );
    }
}



