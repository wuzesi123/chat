import 'package:chat/network/http/api.dart';
import 'package:get/get.dart';

import '../../network/http/model/info_req.dart';
import '../../network/http/model/login_req.dart';
import '../../network/websocket/socket.dart';
import '../../utils/GlobalData.dart';
import '../../utils/signUtil.dart';
import '../../utils/snackbar.dart';
import '../../utils/sp_utils.dart';
import '../main_page/view.dart';
import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  login(String email, String password) async {
    LoginReq loginReq = LoginReq(
      sign: '',
      timestamp: 0,
      email: email,
      password: password,
    );
    loginReq.password = await SignUtil.rsa(loginReq.password);
    var res = await OpenApi().getUserApi().apiUserLoginPost(loginReq: loginReq);
    if (res!.data!.code == 200) {
      await SPUtil().setString("token", res.data!.data!.token);
      await SPUtil().setString("email", email);
      await SPUtil().setString("uid", res.data!.data!.uid);
      GlobalData.uid = res.data!.data!.uid;
      getUserInfo(GlobalData.uid,email);
    } else {
      SnackBar.show("Chat", res.data!.msg);
    }
  }

  getUserInfo(String uid,String email) async {
    InfoReq infoReq = InfoReq(sign: '', timestamp: 0, uid: uid, email: email);
    var res = await OpenApi().getUserApi().apiUserInfoPost(infoReq: infoReq);
    if (res!.data!.code == 200) {
      GlobalData.email.value = res.data!.data.info.email;
      GlobalData.money.value = res.data!.data.info.money;
      GlobalData.phone.value = res.data!.data.info.phone;
      Map<String, dynamic> params = {
        "uid": GlobalData.uid,
        "sign": "",
        "timestamp": DateTime.now().millisecondsSinceEpoch,
      };
      params["sign"] = SignUtil.getSign(params);
      SocketClient.listenWebSocket(params, uid);
      Get.to(const Main_pagePage());
    } else {
      SnackBar.show("Chat", res.data!.msg);
    }
  }
}
