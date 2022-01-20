
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controller/home_controller.dart';
import 'package:patterns_getx/controller/post_detail_controller.dart';
import 'package:patterns_getx/models/post_model.dart';
import 'package:patterns_getx/pages/post_detail_page.dart';
import 'package:patterns_getx/pages/update_page.dart';

Widget itemOfList(HomeController controller, Post post) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(post.body),
        ],
      ),
    ),
    actions: [
      IconSlideAction(
        caption: "Update",
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: (){
          Get.to(UpdatePost(title: post.title,body: post.body,id: post.id,));
          // Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(title: post.title,body: post.body,id: post.id,)));
        },
      ),
    ],
    secondaryActions: [
      IconSlideAction(
        caption: "Delete",
        color: Colors.red,
        icon: Icons.delete,
        onTap: (){
          controller.deletePostList(post).then((value) => {
            if(value){
              controller.apiPostList()
            }
          });
        },
      ),
      IconSlideAction(
        caption: "Info",
        color: Colors.blue,
        icon: Icons.arrow_forward_ios_sharp,
        onTap: (){
        Get.offAll(() => DetailPage(id: post.id.toString(),));
          }
      )
    ],
  );
}
