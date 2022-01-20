
import 'package:get/get.dart';
import 'package:patterns_getx/models/post_model.dart';
import 'package:patterns_getx/services/http_service.dart';

class HomeController extends GetxController{

  var items = new List<Post>().obs;
  var isLoading = false.obs;

  Future apiPostList() async {
    var response = await Network.GET(Network.API_List, Network.paramsEmpty());
    print(response);
    isLoading(true);
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = [];
    }
    isLoading(false);
    print("++++++++");
    //print(items);
  }

  Future<bool> deletePostList(Post post) async {
    isLoading(false);
    var response = await Network.Del(Network.API_Delete + post.id.toString(), Network.paramsEmpty());
    print("DeletePost => ${response.toString()}");
    isLoading(true);
    return response != null;
  }


}