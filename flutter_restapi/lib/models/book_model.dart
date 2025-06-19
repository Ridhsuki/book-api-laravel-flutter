class BookModel {
  int? id;
  String? title;
  String? writer;
  String? release;
  String? createdAt;
  String? updatedAt;

  BookModel(
      {this.id,
      this.title,
      this.writer,
      this.release,
      this.createdAt,
      this.updatedAt});

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    writer = json['writer'];
    release = json['release'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['writer'] = this.writer;
    data['release'] = this.release;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
