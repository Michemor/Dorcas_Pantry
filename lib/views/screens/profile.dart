import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/views/widgets/profileText.dart';

import 'login.dart';

// fetch user data from the database

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  File? _userImage;
  final ImagePicker _pick = ImagePicker();
  

// image picker for profile picture
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _pick.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _userImage = File(pickedFile.path);
      });
    }
  }

// 
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile',    
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            color: white,
            fontWeight: FontWeight.w700,
          )
        )
        ),
        foregroundColor: white,
        centerTitle: true,
        elevation: 3.0,
        backgroundColor: primary,
        actions: [
              IconButton(onPressed: () {
                Get.to(() => const Login());
              }, icon: const Icon(Icons.logout_outlined)),
              IconButton(onPressed: () {
                
              }, icon: const Icon(Icons.settings)),
            ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            CircleAvatar(
              radius: 60,
              backgroundColor: secondary,
              backgroundImage: _userImage != null ? FileImage(_userImage!) : null,
              child: _userImage == null ? const Icon(
                Icons.person,
                size: 60,
                color: primary,
              ) : null,
            ),
            SizedBox(height: 5),
           Text('PROFILE PHOTO',
           style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600, 
            )
           ),),
           Profiletext(),
          ],
        ),
      ),
    );
  }
}