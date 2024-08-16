class GetListCoursBooking {
  List<Reservations>? reservations;
  bool? status;

  GetListCoursBooking({this.reservations, this.status});

  GetListCoursBooking.fromJson(Map<String, dynamic> json) {
    if (json['reservations'] != null) {
      reservations = <Reservations>[];
      json['reservations'].forEach((v) {
        reservations!.add(new Reservations.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reservations != null) {
      data['reservations'] = this.reservations!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Reservations {
  int? id;
  int? numberOfPeople;
  String? clas;
  String? status;
  int? price;
  int? userId;
  int? courseId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Course? course;

  Reservations(
      {this.id,
      this.numberOfPeople,
      this.clas,
      this.status,
      this.price,
      this.userId,
      this.courseId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.course});

  Reservations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numberOfPeople = json['number_of_people'];
    clas = json['clas'];
    status = json['status'];
    price = json['price'];
    userId = json['user_id'];
    courseId = json['course_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    course =
        json['course'] != null ? new Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number_of_people'] = this.numberOfPeople;
    data['clas'] = this.clas;
    data['status'] = this.status;
    data['price'] = this.price;
    data['user_id'] = this.userId;
    data['course_id'] = this.courseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    return data;
  }
}

class Course {
  int? id;
  String? description;
  var duration;
  String? begin;
  String? end;
  var  valid;
  int? club;
  int? trainerId;
  int? serviceId;
  String? createdAt;
  String? updatedAt;

  Course(
      {this.id,
      this.description,
      this.duration,
      this.begin,
      this.end,
      this.valid,
      this.club,
      this.trainerId,
      this.serviceId,
      this.createdAt,
      this.updatedAt});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    duration = json['duration'];
    begin = json['begin'];
    end = json['end'];
    valid = json['valid'];
    club = json['club'];
    trainerId = json['trainer_id'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['begin'] = this.begin;
    data['end'] = this.end;
    data['valid'] = this.valid;
    data['club'] = this.club;
    data['trainer_id'] = this.trainerId;
    data['service_id'] = this.serviceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
