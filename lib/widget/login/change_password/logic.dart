import 'dart:async';

import 'package:get/get.dart';

import '../../../network/http/api.dart';
import '../../../network/http/model/get_email_code_req.dart';
import 'state.dart';

class ChangePasswordLogic extends GetxController {
  final ChangePasswordState state = ChangePasswordState();

  getCode() async {
    GetEmailCodeReq getEmailCodeReq = GetEmailCodeReq(
      sign: '',
      timestamp: 0,
      email: state.email,
    );
    await OpenApi().getEmailApi().apiEmailRegisterPost(getEmailCodeReq: getEmailCodeReq);
    Timer? timer;
    state.time.value = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.time.value <= 0) {
        timer.cancel();
        return;
      }
      state.time.value--;
    });
  }
  changePassword() async{

  }
}
