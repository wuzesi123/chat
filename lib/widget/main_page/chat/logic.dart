import 'package:chat/utils/GlobalData.dart';
import 'package:chatview/chatview.dart';
import 'package:get/get.dart';
import '../../../network/websocket/socket.dart';
import '../../../utils/signUtil.dart';
import 'state.dart';
import 'package:uuid/uuid.dart';
class ChatLogic extends GetxController {
  final ChatState state = ChatState();
  onSendTap(String message, ReplyMessage replyMessage, MessageType messageType){
    final messageData = Message(
      id: const Uuid().v4(),
      message: message,
      createdAt: DateTime.now(),
      sendBy: "1",
      replyMessage: replyMessage,
      messageType: messageType,
    );
    SocketClient.chatController.addMessage(messageData);
    Map<String,dynamic> params = {
      "uid":GlobalData.uid,
      "room_id":state.roomId,
      "q":message,
      "timestamp":DateTime.now().millisecondsSinceEpoch,
      "sign":""
    };
    params["sign"] = SignUtil.getSign(params);
    SocketClient.ask(params);
  }
}
