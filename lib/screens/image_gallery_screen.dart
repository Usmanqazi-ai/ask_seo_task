import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/image_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImageGalleryPage extends StatelessWidget {
  final String searchQuery;
  final ImageController controller = Get.find();

  ImageGalleryPage({super.key, required this.searchQuery}) {
    controller.fetchImages(searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: InkWell(
          onTap: Get.back,
          child: const Icon(
            Icons.west,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'Results: "$searchQuery"',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(children: [
        Image.asset("assets/images/bd_img_top.png"),
        Positioned(
            bottom: 1, child: Image.asset("assets/images/bg_img_bottom.png")),
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else if (controller.images.isNotEmpty) {
            return MasonryGridView.count(
              padding: const EdgeInsets.all(8),
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: controller.images.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    controller.images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          } else {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Could Not Found",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            );
          }
        }),
      ]),
    );
  }
}
