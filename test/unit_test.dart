import 'package:flutter_test/flutter_test.dart';
import 'package:patterns_getx/models/post_model.dart';
import 'package:patterns_getx/services/http_service.dart';

void main(){

  test("Posts is not null", () async{
    var response = await Network.GET(Network.API_List, Network.paramsEmpty());
    List<Post> posts = Network.parsePostList(response);
    expect(posts, isNotNull);
  });

  test("Posts is greater than zero", () async{
    var response = await Network.GET(Network.API_List, Network.paramsEmpty());
    List<Post> posts = Network.parsePostList(response);
    expect(posts.length, greaterThan(0));
  });

  test("Posts are exactly 100", () async{
    var response = await Network.GET(Network.API_List, Network.paramsEmpty());
    List<Post> posts = Network.parsePostList(response);
    expect(posts.length, equals(100));
  });

  test("Check posts title ", () async{
    var response = await Network.GET(Network.API_List, Network.paramsEmpty());
    List<Post> posts = Network.parsePostList(response);
    expect(posts[1].title.toUpperCase(), equals("QUI EST ESSE"));
  });

}