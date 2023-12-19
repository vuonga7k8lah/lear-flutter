class ToDo {
  String? name;
  String? content;
  String? status;

  ToDo(this.name, this.content, this.status);

  factory ToDo.fromJson(Map<String, dynamic> json) =>
      ToDo(json['name'], json['content'], json['status']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'content': content,
        'status': status,
      };
}
