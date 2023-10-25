import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testmasuk2/models/company.dart';
import 'package:testmasuk2/models/user_form.dart';
import 'package:testmasuk2/models/user_type.dart';
import 'package:testmasuk2/providers/user_provider.dart';
import 'package:testmasuk2/utils/helpers/logger.dart';
import 'package:testmasuk2/utils/helpers/random_name.dart';
import 'package:testmasuk2/utils/helpers/snackbar.dart';
import 'package:testmasuk2/utils/routes/approutes.dart';

class HomeController extends GetxController {
  // STATES =========================================================
  var user = UserType().obs;
  var companies = <Detail>[].obs;

  // FORMS =========================================================
  final firstNameTEC = TextEditingController();

  final UserForm _form = UserForm();

  final _errors = <String, String>{}.obs;

  String? getErrorMessage(String key) {
    if (_errors.containsKey(key)) {
      return _errors[key];
    }
    return null;
  }

  removeErrorMessage(String key) {
    if (_errors.containsKey(key)) {
      return _errors.remove(key);
    }
  }

  void updateValue(String key, String value) {
    removeErrorMessage(key);
    switch (key) {
      case UserForm.FIRST_NAME:
        _form.firstName = value;
        break;
    }
  }

  bool validateInput() {
    _errors.clear();

    var valid = true;

    if (_form.firstName.isEmpty) {
      _errors[UserForm.FIRST_NAME] = 'Anda belum memasukan nama';
      valid = false;
    }

    return valid;
  }

  // FILE PICKER LOGIC SECTION =====================================
  Rx<File> fileDocs = Rx(File(""));
  final _picker = ImagePicker();

  _openGallery() {
    _picker.pickImage(source: ImageSource.gallery).then((imageFile) {
      if (imageFile != null) {
        _processFile(UserForm.IMAGE_URL, imageFile.path);
      }
    });
  }

  _openCamera() {
    _picker.pickImage(source: ImageSource.camera).then((imageFile) {
      if (imageFile != null) {
        _processFile(UserForm.IMAGE_URL, imageFile.path);
      }
    });
  }

  File _createFile(String path) {
    final file = File(path);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    return file;
  }

  _processFile(String field, String imagePath) async {
    var imageFile = File(imagePath);
    var imageSize = imageFile.lengthSync();
    if (imageSize > 204800) {
      var tempDir = await getTemporaryDirectory();
      var tempPath = '${tempDir.absolute.path}/${getRandomName()}.jpg';
      _createFile(tempPath);
      FlutterImageCompress.compressAndGetFile(
        imageFile.path,
        tempPath,
        quality: 50,
      ).then((compressedFile) {
        fileDocs.value = File(compressedFile!.path);
        updateValue(field, compressedFile.path);
      }).onError((error, stackTrace) {
        // debugPrint('$error');
      });
    } else {
      fileDocs.value = File(imagePath);
      updateValue(field, imagePath);
    }
  }

  switchAttachment(String value) {
    switch (value) {
      case 'camera':
        _openCamera();
        break;
      case 'gallery':
        _openGallery();
        break;
    }
  }

  // =============================================

  final _provider = Get.find<UserProvider>();

  sendFirstName() {
    if (validateInput()) {
      _provider.sendFirstName(_form).then((value) {
        print("dari value[\"first_name\"] = ${value['first_name']}");

        user.value = UserType.fromMap(value);
        user.refresh();
        firstNameTEC.clear();
        print("dari user.value = ${user.value.firstName}");
      }).onError((error, stackTrace) {
        showSnackBar(error);
      });
    }
  }

  getCompany() {
    _provider.getCompany().then((value) {
      // logger.i(value);

      List<Map<String, dynamic>> mapDatas =
          (value as List).map((e) => Detail().toMap(e)).toList();
      // logger.wtf("mapDatas : ${mapDatas.first['name']}");
      companies.value = mapDatas.map((e) => Detail.fromJson(e)).toList();
    }).onError((error, stackTrace) {
      showSnackBar(error);
    });
  }
}
