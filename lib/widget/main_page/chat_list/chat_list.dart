import 'package:chat/utils/GlobalData.dart';
import 'package:chat/widget/main_page/chat_list/view.dart';
import 'package:components/toly_ui/markdown/markdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'logic.dart';

class ChatListWidget extends StatefulWidget {
  const ChatListWidget({Key? key, required this.currentUser}) : super(key: key);
  final User currentUser;
  @override
  State<ChatListWidget> createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  final logic = Get.put(ChatListLogic());
  final state = Get.find<ChatListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
      key: GlobalData.scrollKey,
      controller: GlobalData.chatListCtl,
      reverse: true,
          child: Column(
            children: List.generate(
                state.messageList.length,
                (index) => Row(
                      mainAxisAlignment: state.messageList[index].sendBy == "2"
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            state.messageList[index].sendBy == "2"
                                ? Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(2, 5, 2, 0),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Image.asset(
                                      "asset/chat_icon.png",
                                      height: 40,
                                      width: 40,
                                    ),
                                  )
                                : SizedBox(),
                            GestureDetector(
                              onDoubleTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: state.messageList[index].message));
                              },
                              child: Card(
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.75),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 10,
                                  ),
                                  margin: const EdgeInsets.fromLTRB(5, 0, 6, 2),
                                  // decoration: BoxDecoration(
                                  //   color: highlightMessage ? highlightColor : _color,
                                  //   borderRadius: _borderRadius(textMessage),
                                  // ),
                                  child: MarkdownWidget(
                                    markdownData:
                                        state.messageList[index].message,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
          ),
        ));
  }
}

class Message {
  Message({
    required this.id,
    required this.message,
    required this.createdAt,
    required this.sendBy,
  });

  /// Provides id
  String id;

  /// Provides actual message it will be text or image/audio file path.
  String message;

  /// Provides message created date time.
  DateTime createdAt;

  /// Provides id of sender of message.
  String sendBy;

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        id: json["id"],
        message: json["message"],
        createdAt: json["createdAt"],
        sendBy: json["sendBy"],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'message': message,
        'createdAt': createdAt,
        'sendBy': sendBy,
      };
}
