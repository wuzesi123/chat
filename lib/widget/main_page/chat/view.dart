import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'logic.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final logic = Get.put(ChatLogic());
  final state = Get.find<ChatLogic>().state;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Obx(() => Scaffold(
          body: ChatView(
            appBar: ChatViewAppBar(
              chatTitle: state.title.value,
            ),
            currentUser: ChatUser(id: '1', name: 'Flutter'),
            isLastPage: true,
            chatController: state.chatController,
            onSendTap: logic.onSendTap,
            chatViewState: ChatViewState.hasMessages,
            chatBackgroundConfig: ChatBackgroundConfiguration(
                backgroundColor: themeData.colorScheme.primaryContainer,
              sortEnable: true
            ),
            sendMessageConfig: SendMessageConfiguration(
              textFieldConfig: TextFieldConfiguration(
                  textStyle: themeData.textTheme.bodyMedium),
            ),
          ),
        ));
  }
}
