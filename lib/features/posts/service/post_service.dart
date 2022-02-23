import 'dart:convert';

import 'package:cubit_post_example/features/posts/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostService{
  final _postsUrl ="https://jsonplaceholder.typicode.com/posts";

  Future<List<PostModel>> fetchPosts()async{
    var response = await http.get(Uri.parse(_postsUrl));

    if (response.statusCode == 200) {
      List<PostModel> posts = (jsonDecode(response.body) as List).map((postJson) => PostModel.fromJson(postJson)).toList();
      return posts;
      
    }else{
      throw Exception();
    }
  }

}