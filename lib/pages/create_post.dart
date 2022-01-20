import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controller/create_post_controller.dart';
import 'package:patterns_getx/pages/home_page.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key key}) : super(key: key);
  static String id = "create_post";

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  final controller = Get.put(CreateController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Create new Post",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                texField(hintText: "Title", controller: controller.titleController),
                SizedBox(
                  height: 30,
                ),
                texField(hintText: "Body", controller: controller.bodyController),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size.fromHeight(40)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
                  onPressed: () async {
                    controller.createPostList(context).then((value) => {
                      if(value){
                        Get.offAll(HomePage()),

                      }
                    });
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          controller.isLoading()
              ? Center(child: CircularProgressIndicator())
              : SizedBox.shrink(),
        ],
      ),
    );
  }
  Widget texField({hintText, controller}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
      ),
    );
  }
}
