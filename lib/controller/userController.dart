import 'package:get/get.dart';
import 'package:getx_example/models/user.dart';

class UserController extends GetxController {
  final user = User().obs;

  updateUser(int count) {
    user.update((val) {
      val.name = "Marcus";
      val.count = count;
    });
  }
}
