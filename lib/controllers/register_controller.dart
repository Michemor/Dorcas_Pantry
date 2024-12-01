 import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantry/configs/colors.dart';
import 'package:http/http.dart' as http;
import 'package:pantry/main.dart';
import 'package:pantry/views/screens/adminPanel.dart';
import 'package:pantry/views/screens/home.dart';
import 'package:pantry/views/screens/login.dart';
import 'package:pantry/views/widgets/customDialog.dart';
import 'package:pantry/views/widgets/customSnackBar.dart';

class RegisterController extends GetxController{
  var fname = ''.obs;
  var lname = ''.obs;
  var useremail = ''.obs;
  var usercontact= ''.obs;
  var userpass1 = ''.obs;
  var userpass2 = ''.obs;

  var passwordHidden = true.obs;
  var passHidden = true.obs;
  var isLoading = false.obs;

  Future<void> registerUser({
    String firstname = '', 
    String lastname = '', 
    String email = '', 
    String contact = '', 
    String pass1 = '', 
    String pass2 = ''
    }) async {
    fname.value = firstname.trim();
    lname.value = lastname.trim();
    useremail.value = email.trim();
    usercontact.value = contact;
    userpass1.value = pass1.trim();
    userpass2.value = pass2.trim();
    final serverData;
    // loaing state to true
    isLoading.value = true;

    try{
    await Future.delayed(const Duration(seconds: 2));
      final response = await http.post(
        Uri.parse('http://class-26.com/dorcas_pantry_jema/register.php'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String> {
          'fname': fname.value,
          'lname': lname.value,
          'email': useremail.value,
          'phone': usercontact.value,
          'pass': userpass1.value
        }),
      );
      
      if (response.statusCode == 200){
         print(response.body);
        serverData = jsonDecode(response.body);
        if(serverData['success'] == true){
          if (serverData['userdetails']['firstname'] == 'admin') {
            Get.to(Adminpanel());
          } else {
          actionDialog(title: 'Successful registration', message: 'Proceed to login');
          Get.to(const Login());
          }
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
        actionDialog(title: 'Error', message: 'Failed to connect to the server ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  }