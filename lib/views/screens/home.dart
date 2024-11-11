
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/controllers/home_controller.dart';
import 'package:pantry/views/screens/dashboard.dart';
import 'package:pantry/views/screens/donate.dart';
import 'package:pantry/views/screens/profile.dart';
import 'package:pantry/views/widgets/activityCard.dart';
import 'package:pantry/views/widgets/bottomNav.dart';
import 'package:pantry/views/widgets/customText.dart';
import 'package:pantry/views/widgets/nav.dart';
import 'package:weekly_calendar/weekly_calendar.dart';



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
      backgroundColor: white,
      body: Column(
        children: [
          const SizedBox(height: 20,),
          customText(
            text: greeting(),
            textSize: 18,
            textWeight: FontWeight.w500,
            
          ),
      //    Card(
      //      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      //      color: const Color.fromARGB(255, 255, 255, 255),
      //      elevation: 2,            
      //      shape: const RoundedRectangleBorder(
      //        borderRadius: BorderRadius.zero,
      //      ),
      //
      //      child:
      //            Padding(
      //              padding: const EdgeInsets.all(10.0),
      //              child: Column(
      //                mainAxisAlignment: MainAxisAlignment.start,
      //                children: [
      //                  Text('Current Donations',
      //                  style: GoogleFonts.roboto(
      //                    textStyle: TextStyle(
      //                      color: primary,
      //                      fontWeight: FontWeight.w500,
      //                      fontSize: 15,
      //                    ),
      //                  ),),
      //
      //                  SizedBox(height: 10.0,),
      //                  const LinearProgressIndicator(
      //                    value: 0.2,
      //                    backgroundColor: secondary,
      //                    color: primary,
      //                  ),
      //                  SizedBox(height: 10.0,),
      //                 Text('20% to target',
      //                  style: GoogleFonts.roboto(
      //                    textStyle: const TextStyle(
      //                      color: black,
      //                      fontWeight: FontWeight.w500,
      //                    ),
      //                  )
                      // )
                      
           const Divider(
             indent: 10,
             endIndent: 10,
            ), 

            const WeeklyCalendar(
              calendarStyle: CalendarStyle(
                locale: "en",
                headerDateTextAlign: Alignment.topLeft,
                isShowFooterDateText: false,
      
              ),
            ),

            customText( text: 'Ongoing Activities',
            textSize: 18,
            textWeight: FontWeight.w500),
            Expanded(

              child: ListView(
                
                children: const [
                  Activitycard(
                    title: Text('Children\s home visit'),
                    subtitle: Text('Visit to Taraja Boy\'s home'),
                    someIcon: Icon(Icons.handshake),
                  ),
                  Activitycard(
                    title: Text('DUSA Children\'s home visit'),
                    subtitle: Text('Pillars of Hope'),
                    someIcon: Icon(Icons.add_reaction_rounded),
                  ),
                  Activitycard(
                    title: Text('DCF: Hands to Work'),
                    subtitle: Text('Community Service Daystar Market'),
                    someIcon: Icon(Icons.add_task),
                  ),
                ],
              ),
            )
           
                      ],
                    ),
    );
    }
String greeting(){

  DateTime now = DateTime.now();
  var greet = "";
  if (now.hour >= 6 && now.hour < 12) {
    greet = "Good morning";
  }
  else if (now.hour >= 12 && now.hour <= 16){
    greet = "Good afternoon";
  } else {
    greet = "Good evening";
  }

  return greet;

}


}

