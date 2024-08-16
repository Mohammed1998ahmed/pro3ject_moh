class DetailsClassModel {
  String? message;
  List<Classes>? classes;
  bool? status;

  DetailsClassModel({this.message, this.classes, this.status});

  DetailsClassModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Classes {
  int? id;
  String? class1;
  String? start;
  String? end;
  int? price;
  int? counter;
  int? capacity;
  String? status;
  int? courseId;
  String? createdAt;
  String? updatedAt;

  Classes(
      {this.id,
      this.class1,
      this.start,
      this.end,
      this.price,
      this.counter,
      this.capacity,
      this.status,
      this.courseId,
      this.createdAt,
      this.updatedAt});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    class1 = json['class'];
    start = json['start'];
    end = json['end'];
    price = json['price'];
    counter = json['counter'];
    capacity = json['capacity'];
    status = json['status'];
    courseId = json['course_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['class'] = this.class1;
    data['start'] = this.start;
    data['end'] = this.end;
    data['price'] = this.price;
    data['counter'] = this.counter;
    data['capacity'] = this.capacity;
    data['status'] = this.status;
    data['course_id'] = this.courseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
