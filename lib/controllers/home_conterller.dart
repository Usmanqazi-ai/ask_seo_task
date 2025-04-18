import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeCtrl extends GetxController {
  static HomeCtrl get instance => Get.find();

  final TextEditingController searchController = TextEditingController();
  var titles = ["Filmic", "Photo", "High Flash", "Neon"].obs;
  var img = [
    "assets/images/list_img.png",
    "assets/images/img_2.png",
    "assets/images/img_3.png",
    "assets/images/img_4.png"
  ].obs;

  var selectedHorizontalItem = 0.obs;

  void selectHorizontalItem(int index) {
    selectedHorizontalItem.value = index;
  }
}
