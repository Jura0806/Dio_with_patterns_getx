import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/models/post_model.dart';
import 'package:patterns_getx/pages/home_page.dart';
import 'package:patterns_getx/services/http_service.dart';

class UpdateController extends GetxController{

  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var isLoading = false.obs;
  Random random = new Random();


  void updatePostList(BuildContext context, int id) async {
    Post post = Post(title: titleController.text, body: bodyController.text, userId: random.nextInt(10));
      isLoading(true);

    var response =
    await Network.PUT(Network.API_Update + id.toString(), Network.paramsUpdate(post));
    print(response);

      if(response != null){
        Get.offAll(HomePage());
      }
      isLoading(false);

    print("CreatePost => $response");
  }

}