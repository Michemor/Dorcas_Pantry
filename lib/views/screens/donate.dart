import 'package:flutter/material.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/views/widgets/bottomNav.dart';
import 'package:pantry/views/widgets/nav.dart';

class Donate extends StatelessWidget {
  const Donate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(navTitle: Text("Donate")),
    );
  }
}