import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../utils/GlobalData.dart';
import '../../utils/signUtil.dart';
import '../../utils/snackbar.dart';
import '../../utils/sp_utils.dart';
import '../../widget/main_page/chat/view.dart';
import '../../widget/main_page/chat_list/chat_list.dart';
import '../../widget/main_page/chat_list/logic.dart';
import 'model/chat_item.dart';

class SocketClient {
  static const String socketUrl = "http://chat.pkwinners.com";

  //static const String socketUrl = "http://10.0.0.7:5000";
  static List<Message> chatList = <Message>[];
  static Socket? socket;
  static bool actionStatus = false;

  static String roomId = "";

  static clean() async {
    if (socket != null) {
      if (SocketClient.socket!.connected) {
        SocketClient.socket!.dispose();
      }
    }
  }

  send(Map<String, dynamic> data) {
    socket!.emit('get_hands', data);
  }

  static listenWebSocket(
      Map<dynamic, dynamic> params, String uid) async {
    final logic = Get.put(ChatListLogic());
    final state = Get.find<ChatListLogic>().state;
    String token = await SPUtil().get("token");
    Map<String, dynamic> headers = {"token": token};
    await clean();
    socket = io(
      SocketClient.socketUrl,
      <String, dynamic>{
        'extraHeaders': headers,
        'transports': ['websocket'],
        'auth': params,
        //"namespace":"/chat",
        "autoConnect": true,
        'timeout': 1000,
      },
    );
    socket!.on('ping', (data) {});
    socket!.on('pong', (data) {});
    socket!.on('connect', (data) async {
      print('connect');
    });
    socket!.on('error', (data) {
      EasyLoading.showError("Error",
          duration: const Duration(milliseconds: 300));
    });
    // 链接断开时调用
    socket!.on('disconnect', (data) {});
    socket!.on('ask_message', (data) {
      state.messageList.removeLast();
      data = json.decode(data);
      if (data["code"] == 200) {
        Message messageData = Message(
          message: data["data"]["answer"],
          createdAt: DateTime.now(),
          sendBy: "2",
          id: '',
        );
        state.messageList.add(messageData);
        GlobalData.chatListCtl.animateTo(
          0.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        SnackBar.show("Chat", "${data["msg"]}");
      }
      print(data);
    });
    socket!.on("join_message", (data) {
      print(data);
      Map<String, dynamic> map = json.decode(data);
      print(map["data"]["text"]);
      if (map["data"]["text"] != null) {
        List<ChatItem> res =
            ChatItem.listFromJson(json.decode(map["data"]["text"]))!;
        state.messageList.clear();
        for (var element in res) {
          Message messageData = Message(
            message: element.content,
            createdAt: DateTime.now(),
            sendBy: element.role == "user" ? "1" : "2", id: "",
          );
          state.messageList.add(messageData);
        }
      } else {
        state.messageList.value = [];
      }
      Get.to(ChatPage(roomId: roomId));
      EasyLoading.dismiss();
    });
    socket!.on("user_message", (data) {
      print(data);
    });
    socket!.on("reconnect", (data) => print("reconnect"));
    socket!.connect();
  }

  static leave(Map<String, dynamic> params) {
    socket!.emitWithAck("leave", params, ack: (res) {
      print(res);
    });
    socket!.dispose();
  }

  static ask(Map<String, dynamic> params) {
    socket!.emit("ask", params);
  }

  static joinInRoom(String uid, String roomId2){
    roomId = roomId2;
    Map<String, dynamic> params = {
      "uid": uid,
      "room_id": roomId2,
      "timestamp": 0,
      "sign": "",
    };
    params["timestamp"] = DateTime.now().millisecondsSinceEpoch;
    params["sign"] = SignUtil.getSign(params);
    socket!.emit("join", params);
  }
}
