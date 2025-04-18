import 'package:get/get.dart';

class PopUpCtrl extends GetxController {
  static PopUpCtrl get instance => Get.find();
  var switchValue = false.obs;

  final List<String> chipTitles = [
    'Stable Diffusion',
    'Dall -E',
  ];
  final List<String> ratioIcons = [
    'assets/icons/ratio_1_1.png',
    'assets/icons/ratio_2.png',
    'assets/icons/ratio_3.png',
    'assets/icons/ratio_4.png',
    'assets/icons/ratio_5.png',
    'assets/icons/ratio_6.png',
    'assets/icons/ratio_7.png',
  ];
  final List<String> modelTitles = [
    '1:1',
    '4:3',
    '3:4',
    '2:3',
    '3:2',
    "9:16",
    "9:16",
  ];
  final List<bool> chipAvtar = [
    false,
    true,
    true,
  ];
  final List<bool> modelAvtar = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];
  var selectedModelChip = 0.obs;

  var selectedChip = 0.obs;

  void uSelectedChip(int index) {
    selectedChip.value = index;
  }

  void modelSelectedChip(int index) {
    selectedModelChip.value = index;
  }

  void uSelectedChipAvtar(int index) {
    selectedChip.value = index;
  }

  void modelSelectedChipAvtar(int index) {
    selectedChip.value = index;
  }

  void switchFun() {
    switchValue.value = !switchValue.value;
  }
}
