import 'package:chat/network/http/model/room_list_req.dart';
import 'package:get/get.dart';

import '../../network/http/api.dart';
import '../../network/http/model/char_room.dart';
import '../../network/http/model/create_chat_req.dart';
import '../../network/http/model/info_req.dart';
import '../../utils/GlobalData.dart';
import '../../utils/snackbar.dart';
import '../../utils/sp_utils.dart';
import 'state.dart';

class Main_pageLogic extends GetxController {
  final Main_pageState state = Main_pageState();

  getUserInfo() async {
    String uid = await SPUtil().get("uid");
    String email = await SPUtil().get("email");
    InfoReq infoReq = InfoReq(sign: '', timestamp: 0, uid: uid, email: email);
    var res = await OpenApi().getUserApi().apiUserInfoPost(infoReq: infoReq);
    if (res!.data!.code == 200) {
      GlobalData.email.value = res.data!.data.info.email;
      GlobalData.money.value = res.data!.data.info.money;
      GlobalData.phone.value = res.data!.data.info.phone;
      getChatRoom();
    } else {
      SnackBar.show("Chat", res.data!.msg);
    }
  }

  createChatRoom() async {
    String uid = await SPUtil().get("uid");
    CreateChatReq createChatReq = CreateChatReq(sign: '', timestamp: 0, uid: uid);
    var res = await OpenApi().getChatApi().apiChatCreatePost(createChatReq:createChatReq);
    if (res!.data!.code == 200) {
      CharRoom data = CharRoom(
        createTime: res.data!.data.createTime,
        roomId: res.data!.data.roomId,
        title: res.data!.data.title,
        uid: uid,
        updateTime: res.data!.data.updateTime,
      );
      state.chatList.insert(0, data);
      //getChatRoom();
    } else {
      SnackBar.show("Chat", res.data!.msg);
    }
  }

  getChatRoom() async {
    RoomListReq roomListReq =
        RoomListReq(sign: "", timestamp: 0, uid: GlobalData.uid);
    var res = await OpenApi()
        .getChatApi()
        .apiChatRoomListPost(roomListReq: roomListReq);
    if (res!.data!.code == 200) {
      state.chatList.value = res.data!.data;
    } else {
      SnackBar.show("Chat", res.data!.msg);
    }
  }
}
