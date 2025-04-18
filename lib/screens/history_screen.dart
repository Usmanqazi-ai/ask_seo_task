import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/image_controller.dart';
import 'image_gallery_screen.dart';

class SearchHistoryPage extends StatelessWidget {
  final ImageController controller = Get.find();

  SearchHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // your preferred background
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "History",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffB6FF60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/icons/pro_btn_icon.png", height: 18),
                      const SizedBox(width: 4),
                      const Text(
                        "Pro",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 History List
            Expanded(
              child: Obx(() {
                if (controller.searchHistory.isEmpty) {
                  return const Center(
                    child: Text(
                      'No search history',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: controller.searchHistory.length,
                  itemBuilder: (context, index) {
                    final query = controller.searchHistory[index];
                    return Card(
                      color: Colors.grey[850],
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        title: Text(
                          query,
                          maxLines: 4,
                          style: const TextStyle(color: Color(0xff777777)),
                        ),
                        trailing: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            child: Image.asset(
                              "assets/images/panda_img.png",
                              height: 50,
                              width: 50,
                              fit: BoxFit.fill,
                            )),
                        onTap: () {
                          controller.fetchHistoryImages(query);
                          Get.to(() => ImageGalleryPage(searchQuery: query));
                        },
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
