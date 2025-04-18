import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ask_seo/controllers/filter_popup_ctrl.dart';
import 'package:task_ask_seo/utils/colors.dart';

class FilterPopup extends StatelessWidget {
  FilterPopup({super.key});

  final controller = Get.put(PopUpCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xff212121),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Center(
                      child: Text(
                        "Advance Settings",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xff939393)),
                      child: IconButton(
                          onPressed: () => Get.back(),
                          icon: Image.asset(
                            "assets/icons/cross_sign.png",
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Select Model",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: List.generate(
                        controller.chipTitles.length,
                        (index) => Obx(() => UFilterChip(
                            index,
                            controller.chipTitles,
                            controller.selectedChip.value,
                            (i) => controller.uSelectedChip(i),
                            controller.chipAvtar,
                            "assets/images/lock.png")))),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "ADD Image",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: UColors.textFiledColor),
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "UpLoad image",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Negative Prompt",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff2F2F31)),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    maxLines: 6,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Color(0xff777777), fontSize: 14),
                        hintText: "Add prompt you don’t want in image..."),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Image Quality",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff2F2F31)),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/hd_icon.png",
                        height: 18,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Expanded(
                        child: Text(
                          "Image Quality",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Obx(
                        () => Switch(
                            inactiveTrackColor: UColors.textFiledColor,
                            inactiveThumbColor: Colors.white,
                            trackOutlineColor: WidgetStateColor.transparent,
                            activeColor: const Color(0xff2870EA),
                            value: controller.switchValue.value,
                            onChanged: (value) {
                              controller.switchFun();
                            }),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Select Model",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                    runSpacing: 0,
                    spacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: List.generate(
                        controller.modelAvtar.length,
                        (index) => Obx(() => UFilterChip(
                              index,
                              controller.modelTitles,
                              controller.selectedModelChip.value,
                              (i) => controller.modelSelectedChip(i),
                              controller.modelAvtar,
                              controller.ratioIcons[index],
                            )))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget UFilterChip(
  int index,
  List<String> title,
  int selectedIndex,
  Function(int) onSelected,
  List<bool> avtar,
  String avtarIcon,
) {
  return FilterChip(
    selected: selectedIndex == index,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    label: Text(
      title[index],
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    backgroundColor: UColors.containerColor,
    showCheckmark: false,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    onSelected: (isSelected) {
      onSelected(index);
    },
    selectedColor: Colors.blue,
    avatar: avtar[index] ? Image.asset(avtarIcon) : null,
  );
}
