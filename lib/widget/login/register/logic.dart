import 'dart:async';

import 'package:chat/network/http/api.dart';
import 'package:get/get.dart';

import '../../../network/http/model/get_email_code_req.dart';
import '../../../network/http/model/register_req.dart';
import 'state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();

  register() async {
    RegisterReq registerReq = RegisterReq(
      sign: '',
      timestamp: 0,
      email: state.email,
      password: state.password,
      code: state.code,
    );
    var res = await OpenApi().getUserApi().apiUserRegisterPost();

  }

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


}
