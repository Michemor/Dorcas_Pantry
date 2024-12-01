import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantry/configs/colors.dart';

class Profiletext extends StatefulWidget {
  const Profiletext({super.key});

  @override
  State<Profiletext> createState() => _ProfiletextState();
}

class _ProfiletextState extends State<Profiletext> {
  @override
  void initState(){
    super.initState();
    // _loadUserData();
  }

  Widget build(BuildContext context) {
    TextEditingController _fname = Get.put(TextEditingController());
    TextEditingController _email = Get.put(TextEditingController());
    TextEditingController _contact = Get.put(TextEditingController());
    TextEditingController _password = Get.put(TextEditingController());
    TextEditingController _lname = Get.put(TextEditingController());

    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [

            // formfield for username
            TextFormField(
              controller: _fname,
              cursorColor: primary,
              onTap: () {
                
              },
              decoration: InputDecoration(
                // include text for user
                labelText: 'Firstname',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )
              ),
            ),
            SizedBox(height: 20,),
            // formfield for contact
             TextFormField(
              controller: _lname,
              cursorColor: primary,
              onTap: () {
                
              },
              decoration: InputDecoration(
                // include text for user
                labelText: 'Lastname',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )
              ),
            ),
            SizedBox(height: 20,),
            // formfield for 
             TextFormField(
              controller: _email,
              cursorColor: primary,
              onTap: () {
                
              },
              decoration: InputDecoration(
                // include text for user
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )
              ),
            ),
            const SizedBox(height: 20,),
            // formfield for email
             TextFormField(
              controller: _contact,
              cursorColor: primary,
              onTap: () {
                
              },
              decoration: InputDecoration(
                // include text for user
                labelText: 'Contact',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )
              ),
            ),
            const SizedBox(height: 20,),
            //form field for password

             TextFormField(
              controller: _password,
              cursorColor: primary,
              onTap: () {
                
              },
              decoration: InputDecoration(
                // include text for user
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const SizedBox(width: 60,),
                ElevatedButton(onPressed: () {

                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
                child: Text('Save',
                style: GoogleFonts.roboto(
                  color: white,
                ),)),
                const SizedBox(width: 40,),
                ElevatedButton(onPressed: () {

                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                ),
                child: Text('Edit',
                style: GoogleFonts.roboto(
                  color: white,
                ),)),
              ],
            )
          ],
        )),
    );

  }
}