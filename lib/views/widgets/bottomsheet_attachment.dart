import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetAttachment extends StatelessWidget {
  const BottomSheetAttachment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),

          //CAMERA
          ListTile(
            onTap: () {
              Get.back(result: 'camera');
            },
            visualDensity: VisualDensity.compact,
            leading: const Icon(Icons.camera_alt_rounded, color: Colors.black),
            title: Text('Camera'),
          ),
          Divider(),

          //GALLERY
          ListTile(
            onTap: () {
              Get.back(result: 'gallery');
            },
            visualDensity: VisualDensity.compact,
            leading: Icon(Icons.image, color: Colors.black),
            title: Text('Gallery'),
          ),
        ],
      ),
    );
  }
}
