class GetCourceModel {
  String? message;
  List<Courses>? courses;
  bool? status;

  GetCourceModel({this.message, this.courses, this.status});

  GetCourceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Courses {
  int? id;
  String? description;
  var duration;
  String? begin;
  String? end;
  List<String>? days;
  var valid;
  int? club;
  int? trainerId;
  int? serviceId;
  String? createdAt;
  String? updatedAt;

  Courses(
      {this.id,
      this.description,
      this.duration,
      this.begin,
      this.end,
      this.days,
      this.valid,
      this.club,
      this.trainerId,
      this.serviceId,
      this.createdAt,
      this.updatedAt});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    duration = json['duration'];
    begin = json['begin'];
    end = json['end'];
    days = json['days'].cast<String>();
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
    data['days'] = this.days;
    data['valid'] = this.valid;
    data['club'] = this.club;
    data['trainer_id'] = this.trainerId;
    data['service_id'] = this.serviceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}




// class GetCourceModel {
//   String? message;
//   List<Courses>? courses;
//   bool? status;

//   GetCourceModel({this.message, this.courses, this.status});

//   GetCourceModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     if (json['courses'] != null) {
//       courses = <Courses>[];
//       json['courses'].forEach((v) {
//         courses!.add(new Courses.fromJson(v));
//       });
//     }
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.courses != null) {
//       data['courses'] = this.courses!.map((v) => v.toJson()).toList();
//     }
//     data['status'] = this.status;
//     return data;
//   }
// }

// class Courses {
//   int? id;
//   String? description;
//   int? duration;
//   String? begin;
//   String? end;
//   String? days;
//   int? valid;
//   int? club;
//   int? trainerId;
//   int? serviceId;
//   String? createdAt;
//   String? updatedAt;

//   Courses(
//       {this.id,
//       this.description,
//       this.duration,
//       this.begin,
//       this.end,
//       this.days,
//       this.valid,
//       this.club,
//       this.trainerId,
//       this.serviceId,
//       this.createdAt,
//       this.updatedAt});

//   Courses.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     description = json['description'];
//     duration = json['duration'];
//     begin = json['begin'];
//     end = json['end'];
//     days = json['days'];
//     valid = json['valid'];
//     club = json['club'];
//     trainerId = json['trainer_id'];
//     serviceId = json['service_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['description'] = this.description;
//     data['duration'] = this.duration;
//     data['begin'] = this.begin;
//     data['end'] = this.end;
//     data['days'] = this.days;
//     data['valid'] = this.valid;
//     data['club'] = this.club;
//     data['trainer_id'] = this.trainerId;
//     data['service_id'] = this.serviceId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
