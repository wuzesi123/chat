import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterState {
  RegisterState() {
    formKey = GlobalKey<FormState>();
  }
  String email = "";
  String password = "";
  RxBool showPassword = true.obs;
  RxBool showCodeCheck = true.obs;
  String code = "";
  RxInt time = 0.obs;
  late GlobalKey<FormState> formKey;
}
