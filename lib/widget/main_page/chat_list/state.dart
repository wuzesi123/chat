import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'chat_list.dart';

class ChatListState {
  ChatListState() {
    ///Initialize variables
  }

  RxList<Message> messageList = <Message>[].obs;
}
