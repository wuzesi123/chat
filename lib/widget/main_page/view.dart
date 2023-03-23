import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat/utils/GlobalData.dart';
import 'package:chat/widget/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../login/change_password/view.dart';
import 'chat/view.dart';
import 'logic.dart';

class Main_pagePage extends StatefulWidget {
  const Main_pagePage({Key? key}) : super(key: key);

  @override
  State<Main_pagePage> createState() => _Main_pagePageState();
}

class _Main_pagePageState extends State<Main_pagePage> {
  final logic = Get.put(Main_pageLogic());
  final state = Get.find<Main_pageLogic>().state;
  final _advancedDrawerController = AdvancedDrawerController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await logic.getChatRoom();
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    logic.getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Obx(() => AdvancedDrawer(
          backdropColor: Colors.blueGrey,
          controller: _advancedDrawerController,
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
                  const FlutterLogo(
                    size: 128,
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.account_circle_rounded),
                    title: Text(GlobalData.email.value),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.monetization_on),
                    title: Text("${'余额'.tr}:${GlobalData.money.value.toString()}"),
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
                      Get.offAll(LoginPage());
                    },
                    leading: const Icon(Icons.login_sharp),
                    title: Text('退出登录'.tr),
                  ),
                  const Spacer(),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: const Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                leading: IconButton(
                  onPressed: () {
                    _advancedDrawerController.showDrawer();
                  },
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _advancedDrawerController,
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
                title: Center(
                  child: Text(
                    "Chat",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ]),
            body: Container(
              color: Theme.of(context).colorScheme.onPrimary,
              width: Get.width,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: SmartRefresher(
                  controller: _refreshController,
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
                                            onPressed: (context) async {},
                                            backgroundColor: Colors.redAccent,
                                            foregroundColor: Colors.white,
                                            icon: Icons.delete,
                                          )
                                        ]),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(const ChatPage());
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
                                                  5.w, 5.w, 0, 5.w),
                                              height: 40.w,
                                              width: 40.w,
                                              child: FlutterLogo(
                                                size: 40.w,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    5.w, 2.w, 5.w, 2.w),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      state.chatList[index].title,
                                                      maxLines: 1,
                                                      style: themeData
                                                          .textTheme.titleSmall,
                                                    ),
                                                    AutoSizeText(
                                                      state.chatList[index].updateTime,
                                                      maxLines: 1,
                                                      style: themeData
                                                          .textTheme.bodySmall,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 100.w,
                                              height: 40.w,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(state.chatList[index].createTime,
                                                    maxLines: 1,
                                                    style: themeData.textTheme.bodySmall,
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
        ));
  }
}
