import 'package:chatview/chatview.dart';
import 'package:get/get.dart';

import '../../../network/websocket/socket.dart';

class ChatState {
  ChatState() {
    ///Initialize variables
  }
  ChatUser currentUser = ChatUser(id: '1', name: 'User');
  RxString title = "chat".obs;
  String roomId = "";
}
