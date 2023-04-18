import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat/utils/GlobalData.dart';
import 'package:chat/widget/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../utils/loadingUtil.dart';
import '../../utils/sp_utils.dart';
import '../login/change_password/view.dart';
import 'chat/view.dart';
import 'logic.dart';
import 'recharge/view.dart';

class Main_pagePage extends StatefulWidget {
  const Main_pagePage({Key? key}) : super(key: key);

  @override
  State<Main_pagePage> createState() => _Main_pagePageState();
}

class _Main_pagePageState extends State<Main_pagePage> {
  final logic = Get.put(Main_pageLogic());
  final state = Get.find<Main_pageLogic>().state;
  var advancedDrawerController = AdvancedDrawerController();

  void _onRefresh() async {
    await logic.getChatRoom();
    await logic.getUserInfo();
    state.refreshController.refreshCompleted();
  }

  @override
  void initState() {
    logic.getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Obx(() => SafeArea(
            child: AdvancedDrawer(
          backdropColor: Colors.blueGrey,
          controller: advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          // openScale: 1.0,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          drawer: SafeArea(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(
                      "asset/chat_icon.png",
                      height: 128,
                      width: 128,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.account_circle_rounded),
                    title: Text(GlobalData.email.value),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(RechargePage());
                    },
                    leading: const Icon(Icons.monetization_on),
                    title:
                        Text("${'余额'.tr}:${GlobalData.money.value.toString()}"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(ChangePasswordPage());
                    },
                    leading: const Icon(Icons.password_sharp),
                    title: Text('修改密码'.tr),
                  ),
                  ListTile(
                    onTap: () {
                      SPUtil.reMove("token");
                      Get.offAll(LoginPage());
                    },
                    leading: const Icon(Icons.login_sharp),
                    title: Text('退出登录'.tr),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                leading: IconButton(
                  onPressed: () {
                    advancedDrawerController.showDrawer();
                  },
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: advancedDrawerController,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Icon(
                          value.visible ? Icons.clear : Icons.menu,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                ),
                title: Text(
                  "ChatAi",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        _onRefresh();
                      },
                      icon: const Icon(Icons.refresh))
                  //IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ]),
            body: Container(
              color: Theme.of(context).colorScheme.onPrimary,
              width: Get.width,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: SmartRefresher(
                  controller: state.refreshController,
                  onRefresh: _onRefresh,
                  child: ListView(
                    controller: state.listController,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                              state.chatList.length,
                              (index) => Slidable(
                                    endActionPane: ActionPane(
                                        motion: const DrawerMotion(),
                                        extentRatio: 0.2,
                                        children: [
                                          SlidableAction(
                                            onPressed: (context) async {
                                              state.chatList.removeAt(index);
                                            },
                                            backgroundColor: Colors.redAccent,
                                            foregroundColor: Colors.white,
                                            icon: Icons.delete,
                                          )
                                        ]),
                                    child: InkWell(
                                      onTap: () {
                                        LoadingUtil.show();
                                        logic.joinChat(
                                            state.chatList[index].roomId);
                                      },
                                      child: Card(
                                        color: themeData.cardColor,
                                        shadowColor: themeData.shadowColor,
                                        surfaceTintColor:
                                            themeData.colorScheme.primary,
                                        elevation: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  5, 5, 0, 5),
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              height: 40,
                                              width: 40,
                                              child: Image.asset(
                                                "asset/chat_icon.png",
                                                height: 40,
                                                width: 40,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    5, 2, 5, 2),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      state.chatList[index]
                                                          .title,
                                                      maxLines: 1,
                                                      style: themeData
                                                          .textTheme.titleSmall,
                                                    ),
                                                    AutoSizeText(
                                                      state.chatList[index]
                                                          .updateTime,
                                                      maxLines: 1,
                                                      style: themeData
                                                          .textTheme.bodySmall,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 100,
                                              height: 40,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    state.chatList[index]
                                                        .createTime,
                                                    maxLines: 1,
                                                    style: themeData
                                                        .textTheme.bodySmall,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))),
                    ],
                  )),
            ),
            floatingActionButton: FloatingActionButton(
              //mini: true,
              onPressed: () async {
                await logic.createChatRoom();
                setState(() {});
              },
              tooltip: 'add',
              child: const Icon(Icons.add),
            ),
          ),
        )));
  }
}
