import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../utils/signUtil.dart';
import '../../utils/snackbar.dart';
import '../../widget/login/view.dart';
import 'api/chat_api.dart';
import 'api/email_api.dart';
import 'api/user_api.dart';

//String basePath = "http://chat.pkwinners.com";
String basePath = "https://mock.apifox.cn/m1/2477817-0-default";
BaseOptions options = BaseOptions(
  baseUrl: basePath,
  connectTimeout: 3000,
  receiveTimeout: 10000,
);
Dio dio = Dio(options);

class OpenApi {
  OpenApi() {
    dio.interceptors.add(
        RetryInterceptor(dio: dio, logPrint: print, retries: 3, retryDelays: [
      const Duration(seconds: 5),
      const Duration(seconds: 5),
      const Duration(seconds: 5),
    ]));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (!EasyLoading.isShow) {
        EasyLoading.show(status: 'loading');
      }
      if(options.path!="/api/user/key"){
        //请求拦截，生成时间戳和签名
        options.data["timestamp"] = DateTime.now().millisecondsSinceEpoch;
        options.data["sign"] = SignUtil.getSign(options.data);
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      if (response.data["code"] != 200) {
        SnackBar.show("Chat", response.data["msg"]);
        if (response.data["msg"] == "Session has expired, please log in again!") {
          Get.offAll(LoginPage());
        }
        EasyLoading.dismiss();
        return handler.next(response);
      } else {
        EasyLoading.dismiss();
        return handler.next(response);
      }
    }, onError: (response, handler) {
      EasyLoading.showError("请求错误");
      return handler.next(response);
    }));
  }

  /// Get ChatApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ChatApi getChatApi() {
    return ChatApi(dio);
  }

  /// Get EmailApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EmailApi getEmailApi() {
    return EmailApi(dio);
  }

  /// Get UserApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserApi getUserApi() {
    return UserApi(dio);
  }
}
