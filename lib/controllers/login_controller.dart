import 'package:get/get.dart';
import 'package:pantry/views/screens/dashboard.dart';
import 'package:pantry/views/screens/home.dart';
import 'package:pantry/views/widgets/customDialog.dart';
import 'package:pantry/views/widgets/customSnackBar.dart';

class Logincontroller extends GetxController{
  var username = ''.obs;
  var password = ''.obs;

  checkFields ({name, pass, isPass}){
    if(name && pass){
      verifyUser(
        username: name, 
        password: pass, 
        isPass: isPass);
    }
  }

  // checks the user before login
  verifyUser ({username = '', password = '', isPass = false}) {
    var defaultPassword = 'user';
      if (defaultPassword == password) {
        customSnackBar(
          title: 'Successful', 
          message:'Welcome to Dorcas Pantry');
        Get.to(() => Dashboard());
         } 
        else {
          customDialog(text: 'Password error', message: 'Kindly enter the correct password', action_text: 'Back');
        }
    }
  }
