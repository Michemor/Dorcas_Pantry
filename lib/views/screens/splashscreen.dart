
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/views/screens/login.dart';
import 'package:pantry/views/widgets/customText.dart';
import 'package:pantry/views/widgets/logo.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              mainLogo(assetName: 'assets/images/giving.png',
              imageHeight: 200,
              imageWidth: 200),
              customText(text: 'Welcome to Dorcas\' Pantry',
              textColor: white,
              textSize: 20,
              textWeight: FontWeight.w800),
              const SizedBox(height: 20),
              customText(text: 'Give with a generous Heart. \nReflect God\'s love through giving',
              textColor: white,
              textWeight: FontWeight.w500,
              textSize: 15,
              styleText: FontStyle.italic,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Get.to(() => const Login());
              }, 
              style: OutlinedButton.styleFrom( 
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: secondary,
                  )
                ),
              ),
              child: customText(text: 'GET STARTED',
              textWeight: FontWeight.w300,
              textSize: 10,
              ))
            ],
          ),
        )
        );
    }
  }