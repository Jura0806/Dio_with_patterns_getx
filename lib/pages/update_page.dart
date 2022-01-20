import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controller/update_controller.dart';

class UpdatePost extends StatefulWidget {
  final  String title;
  final String  body;
  final int id;
  const UpdatePost({Key key,  this.title,this.body, this.id}) : super(key: key);


  @override
  _UpdatePostState createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {

  final controller = Get.put(UpdateController());

  @override
  void initState() {
    super.initState();
    controller.titleController.text = widget.title;
    controller.bodyController.text = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Post",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(child: texField(labelText: "Title", controller: controller.titleController)),
            SizedBox(
              height: 30,
            ),
            Container(child: texField(labelText: "Body", controller: controller.bodyController)),
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
                controller.updatePostList(context, widget.id);
              },
              child: Text(
                "Add",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget texField({labelText, controller}) {
    return TextField(
      decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
    );
  }
}
