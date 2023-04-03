import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../network/http/model/char_room.dart';
import '../../network/websocket/socket.dart';

class Main_pageState {
  Main_pageState() {
    ///Initialize variables
  }
  RxString account = "1843067844@qq.com".obs;
  RxInt balance = 0.obs;
  RxList<CharRoom> chatList = <CharRoom>[].obs;
  ScrollController listController = ScrollController();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  SocketClient socketClient = SocketClient();
}
