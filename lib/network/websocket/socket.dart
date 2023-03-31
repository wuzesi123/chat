import 'dart:convert';
import 'package:get/get.dart';
import 'package:chatview/chatview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../utils/signUtil.dart';
import '../../utils/snackbar.dart';
import '../../utils/sp_utils.dart';
import '../../widget/main_page/chat/view.dart';
import 'model/chat_item.dart';

class SocketClient {
  static const String socketUrl = "http://chat.pkwinners.com";
  //static const String socketUrl = "http://10.0.0.7:5000";
  static List<Message> chatList = <Message>[];
  static Socket? socket;
  static bool actionStatus = false;

  static ChatController chatController = ChatController(
    initialMessageList: chatList,
    scrollController: ScrollController(),
    chatUsers: [
      ChatUser(id: '2', name: 'Chat')
    ],
  );

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
      Map<dynamic, dynamic> params, String uid, String roomId) async {
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
      params = {
        "uid": uid,
        "room_id": roomId,
        "timestamp": 0,
        "sign": "",
      };
      params["timestamp"] = DateTime.now().millisecondsSinceEpoch;
      params["sign"] = SignUtil.getSign(params);
      socket!.emit("join", params);
    });
    socket!.on('error', (data) {
      EasyLoading.showError("Error",
          duration: const Duration(milliseconds: 300));
    });
    // 链接断开时调用
    socket!.on('disconnect', (data) {});
    socket!.on('ask_message', (data) {
      data = json.decode(data);
      if(data["code"] == 200){
        Message messageData = Message(
          message: data["data"]["answer"],
          createdAt: DateTime.now(),
          sendBy: "2",
        );
        chatController.addMessage(messageData);
      }else{
        SnackBar.show("Chat", "${data["msg"]}");
      }
      print(data);
    });
    socket!.on("join_message", (data) {
      print(data);
      Map<String, dynamic> map = json.decode(data);
      print(map["data"]["text"]);
      if(map["data"]["text"]!=null){
        List<ChatItem> res = ChatItem.listFromJson(json.decode(map["data"]["text"]))!;
        chatController.initialMessageList.clear();
        for (var element in res) {
          Message messageData = Message(
            message: element.content,
            createdAt: DateTime.now(),
            sendBy: element.role == "user" ? "1" : "2",
          );
          chatController.addMessage(messageData);
        }
      }else{
        chatController.initialMessageList = [];
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
}
