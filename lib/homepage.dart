import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollapicall/controller.dart';
import 'package:scrollapicall/network.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  NewPostController postController = Get.put(NewPostController());

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(NewpostAPi.mylistener);
    NewpostAPi.getNewPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinity Scroll View Flutter"),
      ),
      body: Obx(
        () => postController.isloading.value == false
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: postController.allpost.length,
                  itemBuilder: (context, index) {
                    return Text(
                      postController.allpost[index].title.toString(),
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    );
                  },
                ),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
