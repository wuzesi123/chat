import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class ClauseLogic extends GetxController {
  final ClauseState state = ClauseState();
   loadHtmlFromAsset() async {
    String html = 'asset/clause.html';
    state.webViewController.loadFlutterAsset(html);
  }
}
