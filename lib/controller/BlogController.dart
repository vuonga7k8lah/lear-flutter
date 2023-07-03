import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/blog.dart';
import '../parser/BlogParser.dart';

class BlogController extends GetxController implements GetxService {
  final BlogParser parser;

  List<BlogModel> _blogList = <BlogModel>[];

  List<BlogModel> get blogList => _blogList;

  BlogController({required this.parser}) {}

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    var body = {};
    // var param = {"lat": parser.getLat(), "lng": parser.getLng()};
    Response response = await parser.getBlogs(body);
    if (response.statusCode == 200) {
      _blogList = [];
      response.body.forEach((data) {
        BlogModel cateData = BlogModel.fromJson(data);
        _blogList.add(cateData);
      });
    }
    update();
  }

  Future<Response> create(var body) async {
    Response response = await parser.createBlog(body);
    update();
    return response;
  }
}
