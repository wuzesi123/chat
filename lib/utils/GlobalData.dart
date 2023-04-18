
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalData{
  static String uid = "";
  static RxString email = "".obs;
  static RxString money = "".obs;
  static RxString phone = "".obs;
  static ScrollController chatListCtl = ScrollController();
  static double topHeight = 200.0;
  static GlobalKey scrollKey = GlobalKey();
}