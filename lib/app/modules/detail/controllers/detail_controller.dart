import 'package:get/get.dart';
import 'package:testapi/app/data/listmodel.dart';
import 'package:testapi/app/data/user_provider.dart';

class DetailController extends GetxController {
  final UserProvider userProvider = Get.put(UserProvider());

  var isLoading = true.obs;

  var userDetail = Datum(
    id: 0,
    email: '',
    firstName: '',
    lastName: '',
    avatar: '',
  ).obs;

  @override
  void onInit() {
    super.onInit();

    final userId = Get.arguments;
    if (userId is int) {
      fetchUserDetail(userId);
    } else {
      Get.snackbar('Error', 'Invalid user ID');
    }
  }

  void fetchUserDetail(int id) async {
    isLoading.value = true;
    final response = await userProvider.getDetail(id);
    isLoading.value = false;
    if (response.statusCode == 200) {
      userDetail.value = Datum.fromJson(response.body['data']);
    } else {
      Get.snackbar('Error', 'Failed to fetch user detail: ${response.body}');
    }
  }
}
