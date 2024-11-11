import 'package:get/state_manager.dart';

class Homecontroller extends GetxController{
  var selectedPage = 0.obs;

  updateSelectedPage(index) => selectedPage.value = index;
}


