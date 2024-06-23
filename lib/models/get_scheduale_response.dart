class Scheduale {
  int? id;
  String? content;
  String? type;
  String? createdAt;
  String? updatedAt;

  Scheduale({this.id, this.content, this.type, this.createdAt, this.updatedAt});

  Scheduale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
