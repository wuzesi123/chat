import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../chat/logic.dart';
import 'chat_list.dart';
import 'chatui_textfield.dart';
import 'logic.dart';

typedef StringMessageCallBack = void Function(
    String message);

class ChatListPage extends StatefulWidget {
  User currentUser;

  ChatListPage({Key? key,required this.currentUser}) : super(key: key);

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {

  final logic = Get.put(ChatListLogic());
  final state = Get.find<ChatListLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(child: ChatListWidget(
                  currentUser:widget.currentUser,
              ),),
              SendMessageWidget(
                onSendTap: (String message) {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SendMessageWidget extends StatefulWidget {
  const SendMessageWidget({Key? key,required this.onSendTap,}) : super(key: key);

  /// Provides call back when user tap on send button on text field.
  final StringMessageCallBack onSendTap;
  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height /
                    ((!kIsWeb && Platform.isIOS) ? 24 : 28),
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                6,
                6,
                6,
                6,
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ChatUITextField(
                    focusNode: _focusNode,
                    textEditingController: _textEditingController,
                    onPressed: _onPressed,
                    onRecordingComplete: _onRecordingComplete,
                    onImageSelected: _onImageSelected,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    final logic = Get.put(ChatLogic());
    final state = Get.find<ChatLogic>().state;
    logic.onSendTap(_textEditingController.text);
    if (_textEditingController.text.isNotEmpty && !_textEditingController.text.startsWith('\n')) {
      _textEditingController.clear();
    }
  }

  void _onRecordingComplete(String? path) {
    if (path != null) {

    }
  }

  void _onImageSelected(String imagePath, String error) {
    debugPrint('Call in Send Message Widget');
    if (imagePath.isNotEmpty) {

    }
  }
}



class User {
  String id;
  String name;
  String? profilePhoto;

  User({required this.id, required this.name, this.profilePhoto});
}
