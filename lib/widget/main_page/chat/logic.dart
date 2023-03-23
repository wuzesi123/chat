import 'package:chatview/chatview.dart';
import 'package:get/get.dart';
import 'state.dart';
import 'package:uuid/uuid.dart';
class ChatLogic extends GetxController {
  final ChatState state = ChatState();
  onSendTap(String message, ReplyMessage replyMessage, MessageType messageType){
    final messageData = Message(
      id: const Uuid().v4(),
      message: message,
      createdAt: DateTime.now(),
      sendBy: "2",
      replyMessage: replyMessage,
      messageType: messageType,
    );
    state.chatController.addMessage(messageData);
  }
}
