import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmasuk2/utils/style/buttons.dart';

class ConfirmDialog extends StatelessWidget {
  ConfirmDialog(
      {Key? key,
      this.message = "",
      this.color = const Color(0xFF0870AB),
      this.title = "Konfirmasi!",
      this.messageWidget})
      : super(key: key);
  final String message, title;
  final Widget? messageWidget;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20 * 2),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20 / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20 / 2,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            if (messageWidget != null) ...[
              messageWidget!,
            ] else ...[
              Text(
                message,
                style: const TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(result: false),
                    style: kButtonSolidPrimary.copyWith(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      maximumSize:
                          MaterialStateProperty.all(Size(Get.width, 40)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey[200]!))),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 20 / 2),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(result: true),
                    style: kButtonSolidPrimary.copyWith(
                      backgroundColor: MaterialStateProperty.all(color),
                      maximumSize:
                          MaterialStateProperty.all(Size(Get.width, 40)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: color))),
                    ),
                    child: Text(
                      "Ya",
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
