
import 'package:local_auth/local_auth.dart';
import 'package:get/get.dart';

import '../widget/login/view.dart';
class AuthUtil{
  static final LocalAuthentication auth = LocalAuthentication();
  static bool openPermission = false;
  static bool canAuthenticateWithBiometrics = false;
  static bool canCheckBiometrics = false;
  static init() async {
    canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    canCheckBiometrics = await auth.canCheckBiometrics;
  }

  static getIn()async{
    if(await auth.canCheckBiometrics){

    }else {
      Get.offAll(LoginPage());
    }

  }
}