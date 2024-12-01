import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/views/screens/login.dart';
import 'package:pantry/views/widgets/eventSlider.dart';
import 'package:pantry/views/widgets/ministries.dart';
import 'package:pantry/views/widgets/nav.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        backgroundColor: primary,
        toolbarHeight: 100,
        foregroundColor: white,
        leading: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/sunrise.jpeg'
                ),
              ),
        ),
            title: Column(
              children: [
                Text('Hi Jema',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )
                ),),
                Text(greetUser(),
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,          
                  )
                ),),
              ]
            ),
            
            ),
    
    // body

    body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text('Today\'s activity',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: primary,
              )
            ),),
            Divider(
              color: grey,
              indent: 5,
              endIndent: 	10,
            ),

            // carousel slider for ongoing activities
            Eventslider(),
          Text('Serve Teams',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: primary,
              )
            ),),
            Divider(
              color: grey,
              indent: 5,
              endIndent: 	10,
            ),
            SizedBox(
              width: 500,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Ministries()),
          ],
        ),
      ),
    ),
    
    );
  }

  String greetUser(){
    final currentTime = DateTime.now();
    final hour = currentTime.hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 16) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}


