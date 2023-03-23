import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../utils/signUtil.dart';
import '../../utils/snackbar.dart';
import '../../utils/sp_utils.dart';

class SocketClient {
  static const String socketUrl = "http://pkwinners.com";
  static Socket? socket;
  static bool actionStatus = false;
  static clean() async {
    if(socket != null){
      if (SocketClient.socket!.connected) {
        SocketClient.socket!.dispose();
      }
    }
  }

  send(Map<String, dynamic> data) {
    socket!.emit('get_hands', data);
  }

  static listenWebSocket(
      Map<dynamic, dynamic> params ,String uid, String roomId) async {
    String token = await SPUtil().get("token");
    Map<String, dynamic> headers = {"token": token};
    await clean();
    socket = io(SocketClient.socketUrl, <String, dynamic>{
      'extraHeaders': headers,
      'transports': ['websocket'],
      'params': params,
      "autoConnect": true,
      'timeout': 1000,
    });
    socket!.on('ping', (data) {
    });
    socket!.on('pong', (data) {
    });
    socket!.on('connect', (data) async {
      params = {
        "uid": uid,
        "room_id":roomId,
        "timestamp":0,
        "sign":"",
      };
      params["timestamp"] = DateTime.now().millisecondsSinceEpoch;
      params["sign"] = SignUtil.getSign(params);
      socket!.emitWithAck("join", params, ack: (res) {
        if (res["error_msg"] != "") {
          EasyLoading.dismiss();
          SnackBar.show("PokerAi", "${res["error_msg"]}");
          socket!.dispose();
        }
      });
      EasyLoading.dismiss();
    });
    socket!.on('error', (data) {
      EasyLoading.showError("Error",
          duration: const Duration(milliseconds: 300));
    });
    // 链接断开时调用
    socket!.on('disconnect', (data) {

    });
    socket!.on("join_message", (data) {
      print(data);
    });
    socket!.on("user_message", (data) {
    });
    socket!.on("reconnect", (data) => print("reconnect"));
    socket!.connect();
  }
  static leave(Map<dynamic, dynamic> params){
    socket!.emitWithAck("leave", params, ack: (res) {
      print(res);
    });
    socket!.dispose();
  }

  static ask(Map<dynamic, dynamic> params){
    socket!.emitWithAck("ask", params, ack: (res) {
      print(res);
    });
    socket!.dispose();
  }
}
