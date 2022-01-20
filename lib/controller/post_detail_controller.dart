import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/models/post_model.dart';
import 'package:patterns_getx/pages/post_detail_page.dart';
import 'package:patterns_getx/services/http_service.dart';

class  PostDetailController extends GetxController{

  Post post = Post(title: "Waiting..", body: "Waiting...");
  String title = '';
  String body = '';
  var isLoading = false.obs;

  Future apiPostList(String id) async {
    var response = await Network.GET(Network.API_List  + id, Network.paramsEmpty());
    print(response);
    isLoading(true);
    if (response != null) {
      post = Network.parsePost(response.toString());
      title = post.title;
      body = post.body;
    }
    isLoading(false);
    print("++++++++");
    //print(items);
  }
}