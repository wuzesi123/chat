import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../network/websocket/socket.dart';
import 'logic.dart';

class ChatPage extends StatefulWidget {
  String roomId;
  ChatPage({Key? key,required this.roomId}) : super(key: key);

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
    state.roomId = widget.roomId;
    final ThemeData themeData = Theme.of(context);
    return Obx(() => Scaffold(
          body: ChatView(
            appBar: ChatViewAppBar(
              chatTitle: state.title.value,
              onBackPress: (){
                Get.back();
              },
            ),
            currentUser: ChatUser(id: '1', name: 'User'),
            chatController: SocketClient.chatController,
            onSendTap: logic.onSendTap,
            chatViewState: ChatViewState.hasMessages,
            chatBackgroundConfig: ChatBackgroundConfiguration(
                backgroundColor: themeData.colorScheme.primaryContainer,
              sortEnable: false
            ),
            sendMessageConfig: SendMessageConfiguration(
              textFieldConfig: TextFieldConfiguration(
                  textStyle: themeData.textTheme.bodyMedium),
              allowRecordingVoice: false,

            ),
          ),
        ));
  }
}
