import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:scrollapicall/model.dart';
import 'package:scrollapicall/network.dart';

class NewPostController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getallPost();
  }

  var isloading = false.obs;

  var allpost = <PostModel>[].obs;

  void getallPost() async {
    try {
      isloading(true);
      var allnewfinalpost = await NewpostAPi.getNewPost();
      if (allnewfinalpost != null) {
        allpost.assignAll(allnewfinalpost);
      }
    } finally {
      isloading(false);
    }
  }
}




// class PostController extends GetxController {
//   @override
//   void onInit() {
//     fetchInstructorData();
//     super.onInit();
//   }

//   var isLoading = false.obs;

//   // var allpostlist = PostModel().obs;

//   var allpostlist = [];

//   void fetchInstructorData() async {
//     try {
//       isLoading(true);

//       var instructorlistnew = await PostApi.fetchInstructorData();

//       allpostlist.assign(instructorlistnew);

//       // var instructorlist = await PostApi.fetchInstructorData().then(((value) {
//       //   allpostlist.add(value.obs);
//       //   // allpostlist.value = value;

//       //   return allpostlist;
//       // }));
//       isLoading(false);
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
