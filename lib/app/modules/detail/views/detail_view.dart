import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  DetailView({super.key});
  final userId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('DetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () {
            if (controller.userDetail.value.id == 0) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final user = controller.userDetail.value;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                  radius: 50,
                ),
                const SizedBox(height: 20),
                Text('${user.firstName} ${user.lastName}',
                    style: const TextStyle(fontSize: 20)),
                Text(user.email, style: const TextStyle(fontSize: 16)),
              ],
            );
          },
        ),
      ),
    );
  }
}
