import 'package:chat/widget/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'utils/authUtil.dart';
import 'utils/loadingUtil.dart';
import 'utils/signUtil.dart';
import 'utils/sp_utils.dart';
import 'widget/main_page/view.dart';

var t;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  t = await SPUtil().get("token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return RefreshConfiguration(
              footerTriggerDistance: 15,
              dragSpeedRatio: 0.91,
              headerBuilder: () => const MaterialClassicHeader(),
              footerBuilder: () => const ClassicFooter(),
              enableLoadingWhenNoData: false,
              enableRefreshVibrate: false,
              enableLoadMoreVibrate: false,
              shouldFooterFollowWhenNotFull: (state) {
                // If you want load more with noMoreData state ,may be you should return false
                return false;
              },
              child: DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
                return GetMaterialApp(
                  title: 'ChatAi',
                  // localizationsDelegates: const [
                  //   RefreshLocalizations.delegate,
                  // ],
                  debugShowCheckedModeBanner: false,
                  onInit: () async {
                    LoadingUtil.init();
                    //AuthUtil.init();
                    await SignUtil.init();
                  },
                  locale: Get.deviceLocale,
                  fallbackLocale: const Locale("zh", "CN"),
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.green,
                      brightness: Brightness.light,
                    ),
                    useMaterial3: true,
                  ),
                  darkTheme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.green,
                      brightness: Brightness.light,
                    ),
                    useMaterial3: true,
                  ),
                  home: t == null ? LoginPage() : const Main_pagePage(),
                  builder: EasyLoading.init(),
                );
              }));
        });
  }
}
