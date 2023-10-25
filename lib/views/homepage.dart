import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmasuk2/controllers/auth_controller.dart';
import 'package:testmasuk2/controllers/home_controller.dart';
import 'package:testmasuk2/views/widgets/bottom_input_container.dart';
import 'package:testmasuk2/views/widgets/bottomsheet_attachment.dart';

class MyHomePage extends GetView<HomeController> {
  const MyHomePage({super.key});

  _showBottomSheetAttachment() {
    Get.bottomSheet(
      const BottomSheetAttachment(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ).then((result) {
      if (result != null) {
        controller.switchAttachment(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() => controller.user.value.firstName == null
              ? const Text("Halo, Selamat Datang")
              : Text("Halo, ${controller.user.value.firstName!}")),
          actions: [
            TextButton(
              onPressed: authC.logoutNow,
              child: const Text(
                "LOGOUT",
                style: TextStyle(color: Colors.orange),
              ),
            )
          ],
        ),
        body: Obx(
          () => Center(
            child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    InkWell(
                      onTap: _showBottomSheetAttachment,
                      child: controller.fileDocs.value.path.isEmpty
                          ? DottedBorder(
                              color: Colors.blue,
                              strokeWidth: 2,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(20),
                              dashPattern: const [10, 10],
                              child: Container(
                                height: 200,
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.add_a_photo),
                                    SizedBox(width: 10),
                                    Text(
                                      "Input Gambar",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(controller.fileDocs.value),
                                ),
                              ),
                            ),
                    ),
                    ElevatedButton(
                      onPressed: () => controller.fileDocs.value = File(""),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                      child: const Text("Clear Image"),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Top ${controller.companies.length} Company",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: controller.companies.length,
                        itemBuilder: (context, index) {
                          final data = controller.companies[index];

                          return Card(
                            elevation: 2,
                            child: ListTile(
                              title: Text(data.name!),
                              subtitle: Text(
                                  "${data.address!.street} - ${data.address!.city}"),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomInputBuilder(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
