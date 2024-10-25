import 'package:get/get.dart';
import 'package:testapi/app/data/listmodel.dart';
import 'package:testapi/app/data/user_provider.dart';

class HomeController extends GetxController {
  var users = <Datum>[].obs;
  var isLoading = true.obs;

  final UserProvider userProvider = Get.put(UserProvider());

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    isLoading.value = true;
    final response = await userProvider.getList();
    isLoading.value = false;
    if (response.statusCode == 200) {
      if (response.bodyString != null) {
        ListUserModel userModel = listUserModelFromJson(response.bodyString!);
        users.value = userModel.data;
      } else {
        Get.snackbar('Error', 'Response body is null');
      }
    } else {
      Get.snackbar('Error', 'Failed to fetch users');
    }
  }
}
