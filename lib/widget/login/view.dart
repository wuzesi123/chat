import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'logic.dart';
import 'register/view.dart';

class LoginPage extends StatelessWidget {
  final logic = Get.put(LoginLogic());
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Container(
        color: themeData.colorScheme.background,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Image.asset("asset/ic_launcher.png",
                  height: 100,
                  width: 100,
                )),
            Card(
              child: SizedBox(
                width: 330,
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LoginCard(),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FilledButton(
                              onPressed: () {
                                if (state.formKey.currentState!.validate()) {
                                  logic.login(state.email, state.password);
                                }
                              },
                              child: AutoSizeText("登录".tr)),
                          ElevatedButton(
                              onPressed: () {
                                Get.to(RegisterPage());
                              },
                              child: AutoSizeText("注册".tr))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final logic = Get.put(LoginLogic());
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: 330,
          height: 150,
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Form(
              key: state.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 65.w,
                    child: TextFormField(
                      initialValue: "",
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
                      initialValue: "",
                      onChanged: (value) {
                        state.password = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return "密码不可少于8位".tr;
                        }
                        print(value.length);
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
                              vertical: 5.w, horizontal: 5.w),
                          errorStyle: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.redAccent,
                          )),
                      obscureText: state.showPassword.value,
                    ),
                  ),
                ],
              )),
        ));
  }
}
