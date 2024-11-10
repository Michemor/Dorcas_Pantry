import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantry/views/screens/login.dart';
import 'package:pantry/views/screens/register.dart';
import 'package:pantry/views/widgets/alert.dart';

import '../configs/colors.dart';

class Registercontroller extends GetxController{
  var password = ''.obs;
  var confirmPass = ''.obs;
  var name = ''.obs;
  var email = ''.obs;
  var contact = ''.obs;
  

  // check for empty fields
  checkFields({String name = '', String email = '', String contact = '', String pass1 = '', String pass2 = ''}){
    if (name.isNotEmpty && email.isNotEmpty && contact.isNotEmpty && pass1.isNotEmpty && pass2.isNotEmpty){
      checkPass(pass1: pass1, pass2: pass2);
    } else {
      // place alert dialog for empty credentials
      Get.snackbar(
        'Incomplete details',
        'Enter your details before proceeding',
        snackPosition: SnackPosition.TOP);
    }
    }
  }

  // check password
  checkPass ({pass1, pass2}) {
    if (pass1.compareTo(pass2) == 0) {
      Get.snackbar(
        'Mismatching passwords',
        'Check your password',
        snackPosition: SnackPosition.TOP,
        colorText: primary,
        backgroundColor: Colors.white,
        animationDuration: Duration(seconds: 5));
      Get.to(() => Login());
    } else {
      alert(text: 'Confirm password');
      Get.to(() => Register());
    }
  }