class DeletCoursBooking {
  String? message;
  bool? status;
  Class? class1;

  DeletCoursBooking({this.message, this.status, this.class1});

  DeletCoursBooking.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    class1 = json['class'] != null ? new Class.fromJson(json['class']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.class1 != null) {
      data['class'] = this.class1!.toJson();
    }
    return data;
  }
}

class Class {
  int? id;
  String? class1;
  String? start;
  String? end;
  int? price;
  int? counter;
  int? capacity;
  int? status;
  int? courseId;
  String? createdAt;
  String? updatedAt;

  Class(
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

  Class.fromJson(Map<String, dynamic> json) {
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
