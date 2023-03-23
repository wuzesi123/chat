import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatState {
  ChatState() {
    ///Initialize variables
    chatController = ChatController(
      initialMessageList: messageList,
      scrollController: ScrollController(),
      chatUsers: [ChatUser(id: '2', name: 'Simform')],
    );
  }
  ChatUser currentUser = ChatUser(id: '1', name: 'Flutter');
  RxString title = "chat".obs;
  RxList<Message> messageList = <Message>[].obs;
  late final ChatController chatController;
}
