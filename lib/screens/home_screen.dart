import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ask_seo/controllers/home_conterller.dart';
import 'package:task_ask_seo/screens/filter_popup.dart';
import 'package:task_ask_seo/utils/colors.dart';

import '../controllers/image_controller.dart';
import 'image_gallery_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeCtrl controller = Get.find();
  final ImageController imageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "AI Image Generator",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: const Color(0xffB6FF60)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                          "assets/icons/pro_btn_icon.png"),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const Text(
                                        "Pro",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xff2F2F31)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Type your prompt",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 150,
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(color: Colors.white),
                                    cursorColor: Colors.white,
                                    maxLines: 6,
                                    controller: controller.searchController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle:
                                            TextStyle(color: Color(0xff777777)),
                                        hintText:
                                            "Describe in detail what you want to see in your image"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Select Style (Optional)",
                                style: TextStyle(
                                    fontFamily: "ProductSans",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              ElevatedButton(
                                  onPressed: () => Get.dialog(FilterPopup()),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: UColors.containerColor),
                                  child: const Text(
                                    "Advance",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            // height: 200,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xff2F2F31)),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                      itemCount: controller.img.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) {
                                        return GestureDetector(
                                          onTap: () => controller
                                              .selectHorizontalItem(index),
                                          child: Obx(() {
                                            final isSelected = controller
                                                    .selectedHorizontalItem
                                                    .value ==
                                                index;

                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? const Color(
                                                              0xff7D4BDC)
                                                          : Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                          controller.img[index],
                                                          height: 70,
                                                          width: 70,
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Text(
                                                          controller
                                                              .titles[index],
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                isSelected
                                                                    ? FontWeight
                                                                        .bold
                                                                    : FontWeight
                                                                        .normal,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            backgroundColor:
                                                UColors.textFiledColor),
                                        child: const Text(
                                          "See All",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    final query =
                                        controller.searchController.text.trim();
                                    if (query.isNotEmpty) {
                                      imageController.fetchImages(
                                          query); // ← add to history + fetch
                                      Get.to(() =>
                                          ImageGalleryPage(searchQuery: query));
                                    } else {
                                      Get.snackbar('Warning',
                                          'Please enter a search keyword',
                                          colorText: Colors.white);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      backgroundColor: const Color(0xff1B4AEF)),
                                  icon: Image.asset(
                                    "assets/icons/generate_icon.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                  label: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Generate",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 24,
                                          color: Colors.white),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
