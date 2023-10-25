import 'package:get/route_manager.dart';
import 'package:testmasuk2/utils/binding/initial_binding.dart';
import 'package:testmasuk2/views/gate_screen.dart';
import 'package:testmasuk2/views/homepage.dart';

class AppRoutes {
  static const String rootRoute = '/';
  static const String homeRoute = '/home';

  static List<GetPage> pages = [
    GetPage(
      name: rootRoute,
      page: () => const GateScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: homeRoute,
      page: () => const MyHomePage(),
      binding: InitialBinding(),
    ),
  ];
}
