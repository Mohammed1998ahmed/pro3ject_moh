class CoursBooking {
  String? message;
  Course? course;
  bool? status;

  CoursBooking({this.message, this.course, this.status});

  CoursBooking.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    course =
        json['course'] != null ? new Course.fromJson(json['course']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Course {
  int? userId;
  String? courseId;
  String? numberOfPeople;
  String? clas;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  Course(
      {this.userId,
      this.courseId,
      this.numberOfPeople,
      this.clas,
      this.status,
      this.updatedAt,
      this.createdAt,
      this.id});

  Course.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    courseId = json['course_id'];
    numberOfPeople = json['number_of_people'];
    clas = json['clas'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['course_id'] = this.courseId;
    data['number_of_people'] = this.numberOfPeople;
    data['clas'] = this.clas;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
