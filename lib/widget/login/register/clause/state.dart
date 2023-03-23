import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ClauseState {
  ClauseState() {
    ///Initialize variables
  }

  RxString clause = "".obs;
  WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..enableZoom(false);
}
