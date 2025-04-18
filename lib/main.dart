import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ask_seo/controllers/home_conterller.dart';

import 'app.dart';
import 'controllers/image_controller.dart';

void main() {
  Get.put(ImageController());
  Get.put(HomeCtrl());
  runApp(const MyApp());
}
