import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantry/configs/colors.dart';


// all information here will be queried from the database
final List events = [
  'HighSchool missions',
  'HighSchool missions',
  'HighSchool missions',
  'HighSchool missions',
];

final List eventImages = [
  'assets/images/missions.jpeg',
  'assets/images/missions.jpeg',
  'assets/images/missions.jpeg',
  'assets/images/missions.jpeg',
];

final List displayEvent = [
  Get.to(Event1()),
  Get.to(Event1()),
  Get.to(Event1()),
  Get.to(Event1()),
];

// class for events
class Event1 {}

class Eventslist extends StatelessWidget {
  const Eventslist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      shrinkWrap: true,
      controller: ScrollController(),
      itemBuilder: (context, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            // action to perform when user clicks on tap
          },
          child: Card(
            elevation: 3,
            
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(eventImages[index],
                  width: 80,
                  height: 70,),
                  
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(events[index],
                      style: GoogleFonts.roboto(
                        color: primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                      ),
                      ),
                      Text(lorem(paragraphs: 1, words: 20),
                      style: GoogleFonts.roboto( fontSize: 10 ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      ),
                    
                    ],
                  ),
                ),
    
              ],
            ),
          ),
        );
    });
    }
}