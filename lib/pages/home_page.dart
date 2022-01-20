import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controller/home_controller.dart';
import 'package:patterns_getx/pages/create_post.dart';
import 'package:patterns_getx/views/item_of_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
      ),
      body: Obx(
          () => Stack(
            children: [
              ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (ctx, i) {
                  return itemOfList(controller,controller.items[i]);
                },
              ),
              controller.isLoading()
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox.shrink(),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: (){
        Get.to(CreatePost());
        },
      ),
    );
  }
}
