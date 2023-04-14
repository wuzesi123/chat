import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../main_page/view.dart';
import 'clause/view.dart';
import 'logic.dart';

class RegisterPage extends StatelessWidget {
  final logic = Get.put(RegisterLogic());
  final state = Get.find<RegisterLogic>().state;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(
              "注册".tr,
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
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: ListView(
                    children: [
                      Image.asset("asset/ic_launcher.png",
                        height: 100,
                        width: 100,
                      ),
                      Card(
                        child: SizedBox(
                          width: 330 - 10,
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const RegisterCard(),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                                            logic.register();
                                          }
                                        },
                                        child: AutoSizeText("注册".tr)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "我已阅读",
                                style: themeData.textTheme.bodyMedium),
                            TextSpan(
                              style: const TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                              ),
                              text: "使用条款",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(ClausePage()),
                            ),
                            TextSpan(
                                text: "，并同意遵守。",
                                style: themeData.textTheme.bodyMedium),
                          ]))
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}

class RegisterCard extends StatefulWidget {
  const RegisterCard({Key? key}) : super(key: key);

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  final logic = Get.put(RegisterLogic());
  final state = Get.find<RegisterLogic>().state;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Obx(() => Container(
          width: 330,
          height: 195,
          margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
          child: Form(
              key: state.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 65,
                    child: TextFormField(
                      initialValue: "",
                      validator: (value) {
                        if (GetUtils.isEmail(value!)) {
                          return null;
                        } else {
                          return "请输入邮箱".tr;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
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
                              vertical: 5, horizontal: 5),
                          errorStyle: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.redAccent,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 65,
                    child: TextFormField(
                      initialValue: "",
                      onChanged: (value) {
                        state.password = value;
                      },
                      validator: (value) {
                        if(value ==null){
                          return "密码不可少于8位".tr;
                        }
                        return value.length >= 8 ? null : "密码不可少于8位".tr;
                      },
                      decoration: InputDecoration(
                          icon: const Icon(Icons.password),
                          labelText: '密码'.tr,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          suffixIcon: IconButton(
                            icon: Icon(state.showPassword.value
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined),
                            onPressed: () {
                              state.showPassword.value =
                                  !state.showPassword.value;
                            },
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          errorStyle: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.redAccent,
                          )),
                      obscureText: state.showPassword.value,
                    ),
                  ),
                  SizedBox(
                    height: 65,
                    child: TextFormField(
                      initialValue: "",
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
                              vertical: 5, horizontal: 5),
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
