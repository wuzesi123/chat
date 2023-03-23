import 'package:get/get.dart';

class SnackBar {
  static show(String title,String msg){
    if(Get.isSnackbarOpen){
      //Get.snackbar(title, msg);
    }else{
      Get.snackbar(title, msg);
    }
  }
}