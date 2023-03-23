import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../network/http/model/char_room.dart';

class Main_pageState {
  Main_pageState() {
    ///Initialize variables
  }
  RxString account = "1843067844@qq.com".obs;
  RxInt balance = 0.obs;
  RxList<CharRoom> chatList = <CharRoom>[].obs;
  final ScrollController listController = ScrollController();
}
