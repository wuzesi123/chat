import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginState {
  LoginState() {
    ///Initialize variables
    formKey = GlobalKey<FormState>();
  }

  String email = "";
  String password = "";
  RxBool showPassword = true.obs;
  late GlobalKey<FormState> formKey;
}
