import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:patterns_getx/controller/post_detail_controller.dart';
import 'package:patterns_getx/models/post_model.dart';
import 'package:patterns_getx/pages/home_page.dart';
import 'package:patterns_getx/views/item_of_post.dart';
import 'package:get/get.dart';


class DetailPage extends StatefulWidget {

  final String id;
  const DetailPage({Key key, this.id}) : super(key: key);
  static final String id1 = "one_info_page";

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final controller = Get.put(PostDetailController());
  Post post =  Post(title: "Waiting..", body: "Waiting...");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.apiPostList(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OneInfo"),
        leading: IconButton(
          onPressed: (){
            Get.offAll(() => HomePage());
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body:  Obx(
            () => Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(controller.body),
                ],
              ),
            ),
            controller.isLoading()
                ? Center(child: CircularProgressIndicator())
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
