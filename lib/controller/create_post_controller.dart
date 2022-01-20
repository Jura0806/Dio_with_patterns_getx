import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/models/post_model.dart';
import 'package:patterns_getx/services/http_service.dart';

class CreateController extends GetxController{

  Random random = new Random();
  var isLoading = false.obs ;
  Post post;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  Future<bool> createPostList(BuildContext context) async {
    post = Post(title: titleController.text, body: bodyController.text, userId: random.nextInt(10));
    isLoading(true);
    var response =
    await Network.POST(Network.API_Create, Network.paramsCreate(post));
      isLoading(false);
    print("CreatePost => $response");
    return response != null;
  }

}