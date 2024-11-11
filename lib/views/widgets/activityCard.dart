
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/views/screens/donate.dart';

class Activitycard extends StatelessWidget {

  final Text title;
  final Text subtitle;
  final Icon someIcon;

  const Activitycard({
    super.key, 
    required this.title, 
    required this.subtitle, 
    required this.someIcon,
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      color: secondary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: someIcon,
            title: title,
            subtitle: subtitle,
            enableFeedback: true,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {
                Get.to(() => const Donate());
              }, 
              child: const Text('DONATE',
              style: TextStyle(
                color: primary,
                fontSize: 15,
              ),
              ))
            ],
          )
        ],
      ),
    );
  }
}