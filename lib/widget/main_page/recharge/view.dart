import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class RechargePage extends StatelessWidget {
  final logic = Get.put(RechargeLogic());
  final state = Get.find<RechargeLogic>().state;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Obx(() => SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: Text(
              "充值".tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
                height: 50.w,
                width: 200.w,
                child: Center(child: AutoSizeText(state.rechargeNum.toString())),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {}, child: AutoSizeText("充值".tr)),
                ),
              ),
            ],
          ),
        )));
  }
}
