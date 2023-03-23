import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'logic.dart';

class ClausePage extends StatelessWidget {
  final logic = Get.put(ClauseLogic());
  final state = Get.find<ClauseLogic>().state;
  @override
  StatelessElement createElement() {
    logic.loadHtmlFromAsset();
    return super.createElement();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("用户条款"),
      ),
      body: WebViewWidget(
        controller: state.webViewController,

      ),
    );
  }
}
