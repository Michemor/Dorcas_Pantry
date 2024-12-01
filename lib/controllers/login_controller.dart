import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantry/configs/colors.dart';
import 'package:http/http.dart' as http;
import 'package:pantry/views/screens/dashboard.dart';
import 'package:pantry/views/widgets/customDialog.dart';
import 'package:pantry/views/widgets/customSnackBar.dart';

class LoginController extends GetxController{
  // handles operations on the login page
  var userEmail = ''.obs;
  var userPassword = ''.obs;
  var isPasswordHidden =  true.obs;
  
  var isLoading = false.obs;

  Future<void> handleLogin({ String email = '', String password = ''}) async {
    userEmail.value = email.trim();
    userPassword.value = password.trim();

    final firstname;
    final lastname;
    final serverData;

    isLoading.value = true;
    try{
      await Future.delayed(Duration(seconds: 2));
      // communicate with the server
      // using a get request to get data from database
      final response = await http.post(
        Uri.parse("http://class-26.com/dorcas_pantry_jema/login.php"),
         headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String> {
          'email': userEmail.value,
          'password': userPassword.value,
        }),
        );
      if (response.statusCode == 200){
         print(response.body);
        // we process the data
       serverData = jsonDecode(response.body) as Map<String, dynamic>;
       firstname = serverData['userdetails']['user_firstname'];
       lastname = serverData['userdetails']['user_lastname'];
       if (serverData['success']){
        actionDialog(title:'Successful login', message: 'Welcome ${firstname + ' ' + lastname}');
        Get.to(() => Dashboard());
       } else {
       Get.showSnackbar(
            GetSnackBar(
              backgroundColor: white,
              title: 'Ooops! Error',
              message: serverData['message'],
              icon: Icon(Icons.error_outline_sharp),
              snackPosition: SnackPosition.TOP,
              duration: Duration(seconds: 10),
            )
       );
       }
      } else {
        actionDialog(title: 'Server error', message: 'Please wait as we resolve this issue');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}