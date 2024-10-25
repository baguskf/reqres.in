import 'package:get/get.dart';

class UserProvider extends GetConnect {
  var url = 'https://reqres.in/api/';

  Future<Response> getList() => get("${url}users?page=2");
  Future<Response> getDetail(int id) => get("https://reqres.in/api/users/$id");
}
