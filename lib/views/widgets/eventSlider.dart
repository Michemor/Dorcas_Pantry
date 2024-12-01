import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantry/configs/colors.dart';

// fetch events: event_name, date, image from database

final List eventimg = [
  'assets/images/worshipteam.jpeg',
  'assets/images/outreach.jpeg',
  'assets/images/concert.jpeg'
];

final List eventNames = [
  'Tuesday Chapel',
  'Worship Concert',
  'Children\'s home outreach',
];


class Eventslider extends StatefulWidget {
  const Eventslider({super.key});

  @override
  State<Eventslider> createState() => _EventsliderState();
}

class _EventsliderState extends State<Eventslider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
      itemCount: eventNames.length,
      layout: SwiperLayout.DEFAULT,
      viewportFraction: 0.8,
      scale: 0.9,
    itemWidth: MediaQuery.of(context).size.width,
    itemHeight: MediaQuery.of(context).size.height,
      itemBuilder: (context, index) {
        return Card(
          semanticContainer: true,
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          child: Stack(
            children: [
              ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                       eventimg[index],
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 20,),
                  Text(eventNames[index], 
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      color: white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    )
                  ),),
              Text(lorem(paragraphs: 1, words: 10),
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,)),
                  textAlign: TextAlign.center,
                  ),
              Text(lorem(paragraphs: 1, words: 5),
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  )),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                    ],
              ),
            ],
          ),
        );
      },),
    );
  }
}