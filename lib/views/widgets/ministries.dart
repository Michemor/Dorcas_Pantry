
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/views/widgets/ministrycard.dart';

final List ministries = [
  'Worship Team',
  'Children\'s ministry',
  'Missions',
  'Service Team'
];

final List ministryPics = [
  'assets/images/worship.jpeg',
  'assets/images/chidren.jpeg',
  'assets/images/missions.jpeg',
  'assets/images/sound.jpeg',
  
];

final List<Widget> ministryPages = [
  ministryCard(),
];

class Ministries extends StatelessWidget {
  const Ministries({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      // listview takes up as much space as needed
      shrinkWrap: true,
      // disables internal scrolling
      physics: NeverScrollableScrollPhysics(),
      itemCount: ministries.length,
      itemBuilder: (context, index){
      return GestureDetector(
        onTap: (){},
        child: GestureDetector(
          onTap: (){
            Get.to(ministryPages[index]);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(ministryPics[index],
                    fit: BoxFit.cover,
                    height: 200,
                    
                    ),
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Text(ministries[index],
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: white,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                        ),
                        Divider(indent: 10,
                        endIndent: 12,),
                        SizedBox(height: 10,),
                        Text(lorem(paragraphs: 1, words: 20),
                        style: GoogleFonts.roboto(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );

    });
  }

}

