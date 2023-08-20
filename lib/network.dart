import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scrollapicall/model.dart';

class NewpostAPi {
  static var client = http.Client();

  static Future<List<PostModel>> getNewPost() async {
    int pageNumber = 1;
    List<PostModel> posts = [];
    var response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts?_limit=15&_page=${pageNumber}"));

    var data = jsonDecode(response.body) as List;
    posts = data.map((postJson) => PostModel.fromJson(postJson)).toList();
    print(jsonDecode(response.body));
    return posts;
  }

  static mylistener() {
    print("called");
    getNewPost();
  }
}






// class PostApi {
//   static Future<PostModel> fetchInstructorData() async {
//     // final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//     final response =
//         await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
//     // print(jsonDecode(response.body));

//     if (response.statusCode == 200) {
//       // print(jsonDecode(response.body.toString()));
//       final postModel = PostModel.fromJson(json.decode(response.body));
//       print(postModel);

//       return postModel;
//     } else {
//       print("Error");
//       throw Exception('Failed to fetch courses');
//     }
//   }
// }
