import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordState {
  ChangePasswordState() {
    formKey = GlobalKey<FormState>();
  }
  late GlobalKey<FormState> formKey;
  String email = "";
  String newPassword = "";
  String originPassword = "";
  RxBool showNewPassword = true.obs;
  RxBool showOriginPassword = true.obs;
  RxBool showCodeCheck = true.obs;
  String code = "";
  RxInt time = 0.obs;
}
