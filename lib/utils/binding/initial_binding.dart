import 'package:get/instance_manager.dart';
import 'package:testmasuk2/controllers/auth_controller.dart';
import 'package:testmasuk2/controllers/home_controller.dart';
import 'package:testmasuk2/providers/user_provider.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => UserProvider());
  }
}
