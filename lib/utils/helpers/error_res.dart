import 'package:get/get.dart';
import 'package:testmasuk2/models/res/default_res.dart';

class ErrorRes {
  int code = 0;
  String message = "";
  Response? response;

  ErrorRes(response) {
    if (response is Response && response.statusCode != null) {
      code = response.statusCode!;
      this.response = response;
    }
    message = getErrorMessage(response);
  }

  static String getErrorMessage(response) {
    if (response is Response) {
      try {
        var res = DefaultRes.fromJson(response.body);
        if (res.meta.message.isNotEmpty) {
          return res.meta.message;
        }
      } catch (e) {
        return response.toString();
      }
      switch (response.statusCode) {
        case 200:
        case 201:
        case 202:
          return "Success";
        case 400:
          return "Sorry, we couldn't process the request. Please try again later.";
        case 401:
          return "Your session has ended";
        case 404:
          return "The resource you are looking is temporarily unavailable. Please try again later.";
        case 405:
          return "Method not allowed";
        case 500:
          return "Sorry, we couldn't process the request. Please try again later.";
        default:
          if (response.status.connectionError) {
            return 'Connection Timeout. Please try again later.';
          }
          if (response.statusText != null && response.statusText!.isNotEmpty) {
            return response.statusText!;
          }
          return 'Unknown error.';
      }
    } else {
      return response.toString();
    }
  }

  @override
  String toString() {
    return message;
  }
}
