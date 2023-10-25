import 'dart:io';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

class UserForm {
  static const IMAGE_URL = 'image_url';
  static const FIRST_NAME = 'first_name';

  late String imageUrl;
  late String firstName;

  UserForm() {
    imageUrl = '';
    firstName = '';
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      FIRST_NAME: firstName,
    };
    if (imageUrl.isNotEmpty) {
      var fileDir = File(imageUrl);
      if (fileDir.existsSync()) {
        var fileName = path.basename(imageUrl);
        map[IMAGE_URL] = MultipartFile(fileDir, filename: fileName);
      }
    }
    return map;
  }
}
