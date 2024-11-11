import 'package:flutter/material.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/views/widgets/bottomNav.dart';
import 'package:pantry/views/widgets/customText.dart';
import 'package:pantry/views/widgets/nav.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(navTitle: Text("Profile"),),
    );
  }
}