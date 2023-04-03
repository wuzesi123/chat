import 'dart:async';

import 'package:chat/network/http/model/change_password_req.dart';
import 'package:chat/utils/GlobalData.dart';
import 'package:get/get.dart';

import '../../../network/http/api.dart';
import '../../../network/http/model/change_email_req.dart';
import '../../../network/http/model/get_email_code_req.dart';
import '../logic.dart';
import 'state.dart';

class ChangePasswordLogic extends GetxController {
  final ChangePasswordState state = ChangePasswordState();
  final loginLogic = Get.put(LoginLogic());
  getCode() async {
    ChangeEmailReq changeEmailReq = ChangeEmailReq(
      sign: '',
      timestamp: 0,
      uid: GlobalData.uid,
      email: state.email,
    );
    await OpenApi()
        .getEmailApi()
        .apiEmailChangePost(changeEmailReq: changeEmailReq);
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

  changePassword() async {
    ChangePasswordReq changePasswordReq = ChangePasswordReq(
        sign: "",
        timestamp: 0,
        uid: GlobalData.uid,
        email: state.email,
        originPassword: state.originPassword,
        //需要过去的密码
        newPassword: state.newPassword,
        code: state.code);
    var res = await OpenApi()
        .getUserApi()
        .apiUserChangePasswordPost(changePasswordReq: changePasswordReq);
    if(res!.data!.code == 200){
      loginLogic.login(state.email, state.newPassword);
    }
  }
}
