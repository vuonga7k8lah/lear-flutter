
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      Fluttertoast.showToast(msg: 'Session expired!'.tr);
    } else {
      Fluttertoast.showToast(msg: response.statusText.toString().tr);
    }
  }
}
