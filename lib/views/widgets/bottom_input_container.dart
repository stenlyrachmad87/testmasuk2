import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmasuk2/controllers/home_controller.dart';
import 'package:testmasuk2/models/user_form.dart';

class BottomInputBuilder extends GetView<HomeController> {
  const BottomInputBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey,
            offset: Offset(.5, .5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 50,
                child: TextField(
                  controller: controller.firstNameTEC,
                  decoration: const InputDecoration(
                    hintText: "First Name",
                  ),
                  onChanged: (value) =>
                      controller.updateValue(UserForm.FIRST_NAME, value),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: controller.sendFirstName,
                icon: const Icon(
                  Icons.upload,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
