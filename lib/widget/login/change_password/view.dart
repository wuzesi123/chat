import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ChangePasswordPage extends StatelessWidget {
  final logic = Get.put(ChangePasswordLogic());
  final state = Get.find<ChangePasswordLogic>().state;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Obx(() => Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "修改密码".tr,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        color: themeData.colorScheme.onPrimary,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
                  child: ListView(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 50.w),
                          child: FlutterLogo(size: 100.w)),
                      Card(
                        child: SizedBox(
                          width: 330.w - 10.w,
                          height: 350.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const ChangePasswordCard(),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5.w, 0, 5.w),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          if (state.time.value == 0 && GetUtils.isEmail(state.email)) {
                                            logic.getCode();
                                          }
                                        },
                                        child: AutoSizeText(
                                          state.time.value == 0
                                              ? "获取验证码".tr
                                              : "${state.time.value}",
                                          maxLines: 1,
                                        )),
                                    FilledButton(
                                        onPressed: () {
                                          if(state.formKey.currentState!.validate()){
                                            logic.changePassword();
                                          }
                                        },
                                        child: AutoSizeText("修改密码".tr)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}

class ChangePasswordCard extends StatefulWidget {
  const ChangePasswordCard({Key? key}) : super(key: key);

  @override
  State<ChangePasswordCard> createState() => _ChangePasswordCardState();
}

class _ChangePasswordCardState extends State<ChangePasswordCard> {
  final logic = Get.put(ChangePasswordLogic());
  final state = Get.find<ChangePasswordLogic>().state;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Obx(() => Container(
      width: 330.w,
      height: 260.w,
      margin: EdgeInsets.fromLTRB(5.w, 10.w, 5.w, 5.w),
      child: Form(
          key: state.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 65.w,
                child: TextFormField(
                  validator: (value) {
                    if (GetUtils.isEmail(value!)) {
                      return null;
                    } else {
                      return "请输入邮箱".tr;
                    }
                  },
                  autovalidateMode: AutovalidateMode.always,
                  onChanged: (value) {
                    state.email = value;
                  },
                  decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: '邮箱'.tr,
                      border: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 5.w, horizontal: 5.w),
                      errorStyle: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.redAccent,
                      )),
                ),
              ),
              SizedBox(
                height: 65.w,
                child: TextFormField(
                  onChanged: (value) {
                    state.originPassword = value;
                  },
                  validator: (value) {
                    if(value ==null){
                      return "密码不可少于8位".tr;
                    }
                    return value.length > 8 ? null : "密码不可少于8位".tr;
                  },
                  decoration: InputDecoration(
                      icon: const Icon(Icons.password),
                      labelText: '旧密码'.tr,
                      border: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      suffixIcon: IconButton(
                        icon: Icon(state.showOriginPassword.value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                        onPressed: () {
                          state.showOriginPassword.value =
                          !state.showOriginPassword.value;
                        },
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 5.w, horizontal: 5.w),
                      errorStyle: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.redAccent,
                      )),
                  obscureText: state.showOriginPassword.value,
                ),
              ),
              SizedBox(
                height: 65.w,
                child: TextFormField(
                  onChanged: (value) {
                    state.newPassword = value;
                  },
                  validator: (value) {
                    if(value ==null){
                      return "密码不可少于8位".tr;
                    }
                    return value.length > 8 ? null : "密码不可少于8位".tr;
                  },
                  decoration: InputDecoration(
                      icon: const Icon(Icons.password),
                      labelText: '新密码'.tr,
                      border: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      suffixIcon: IconButton(
                        icon: Icon(state.showNewPassword.value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                        onPressed: () {
                          state.showNewPassword.value =
                          !state.showNewPassword.value;
                        },
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 5.w, horizontal: 5.w),
                      errorStyle: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.redAccent,
                      )),
                  obscureText: state.showNewPassword.value,
                ),
              ),
              SizedBox(
                height: 65.w,
                child: TextFormField(
                  onChanged: (value) {
                    state.code = value;
                  },
                  decoration: InputDecoration(
                      icon: const Icon(Icons.verified_user_outlined),
                      labelText: '验证码'.tr,
                      border: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      suffixIcon: IconButton(
                        icon: Icon(state.showCodeCheck.value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                        onPressed: () {
                          state.showCodeCheck.value =
                          !state.showCodeCheck.value;
                        },
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 5.w, horizontal: 5.w),
                      errorStyle: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.redAccent,
                      )),
                  obscureText: state.showCodeCheck.value,
                ),
              ),
            ],
          )),
    ));
  }
}

