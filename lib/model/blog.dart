class BlogModel {
  String? id;
  String? title;
  String? desc;
  String? image;
  String? created_at;

  BlogModel({this.id, this.title, this.desc, this.image,this.created_at});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'].toString();
    desc = json['desc'].toString();
    image = json['image'].toString();
    created_at = json['created_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['desc'] = desc;
    data['image'] = image;
    data['created_at'] = created_at;

    return data;
  }
}
