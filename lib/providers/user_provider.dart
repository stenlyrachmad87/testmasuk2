import 'package:get/get.dart';
import 'package:testmasuk2/models/user_form.dart';
import 'package:testmasuk2/utils/contant/urls.dart';
import 'package:testmasuk2/utils/helpers/error_res.dart';
import 'package:testmasuk2/utils/helpers/logger.dart';

class UserProvider extends GetConnect {
  Future<dynamic> sendFirstName(UserForm form) async {
    final response = await post('$jsonPlaceholder/posts', form.toMap());
    try {
      if (response.hasError && response.statusCode != 401) {
        return Future.error(ErrorRes(response));
      }
      return response.body;
    } catch (e, s) {
      logger.e('users', e, s);
      return Future.error(ErrorRes(e.toString()));
    }
  }

  Future<dynamic> getCompany() async {
    final response = await get('$jsonPlaceholder/users');
    try {
      if (response.hasError && response.statusCode != 401) {
        return Future.error(ErrorRes(response));
      }
      return response.body;
    } catch (e, s) {
      logger.e('users', e, s);
      return Future.error(ErrorRes(e.toString()));
    }
  }
}
