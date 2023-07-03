import 'package:get/get_connect/http/src/response/response.dart';

import '../api/api.dart';
import '../until/api.dart';

class BlogParser {
  final ApiService apiService;

  BlogParser({required this.apiService});

  Future<Response> getBlogs(var body) async {
    var response = await apiService.getPublic(AppConstants.blogs, body);
    return response;
  }
  Future<Response> createBlog(var body) async {
    var response = await apiService.postPrivate(AppConstants.blogs, body,AppConstants.token);
    return response;
  }



}
