import 'package:chat/utils/GlobalData.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../network/websocket/socket.dart';
import '../../../utils/signUtil.dart';
import '../chat_list/chat_list.dart';
import '../chat_list/logic.dart';
import 'state.dart';
import 'package:uuid/uuid.dart';

class ChatLogic extends GetxController {
  final ChatState state = ChatState();
  final logic = Get.put(ChatListLogic());
  final chatListState = Get.find<ChatListLogic>().state;

  onSendTap(String message) {
    final messageData = Message(
      id: const Uuid().v4(),
      message: message,
      createdAt: DateTime.now(),
      sendBy: "1",
    );
    chatListState.messageList.add(messageData);
    final messageDataLoading = Message(
      id: const Uuid().v4(),
      message: "......",
      createdAt: DateTime.now(),
      sendBy: "2",
    );
    chatListState.messageList.add(messageDataLoading);
    Map<String, dynamic> params = {
      "uid": GlobalData.uid,
      "room_id": state.roomId,
      "q": message,
      "timestamp": DateTime.now().millisecondsSinceEpoch,
      "sign": ""
    };
    params["sign"] = SignUtil.getSign(params);

    SocketClient.ask(params);
    print(GlobalData.chatListCtl.position.maxScrollExtent);
    print(GlobalData.topHeight);
    GlobalData.chatListCtl.animateTo(
      // GlobalData.chatListCtl.position.maxScrollExtent+GlobalData.topHeight,
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
