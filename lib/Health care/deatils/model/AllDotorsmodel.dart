class AllDoctorsModel {
  List<Doctors>? doctors;
  bool? status;

  AllDoctorsModel({this.doctors, this.status});

  AllDoctorsModel.fromJson(Map<String, dynamic> json) {
    if (json['Doctors'] != null) {
      doctors = <Doctors>[];
      json['Doctors'].forEach((v) {
        doctors!.add(new Doctors.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctors != null) {
      data['Doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Doctors {
  int? id;
  String? firstName;
  String? lastName;
  String? description;
  String? image;

  Doctors(
      {this.id, this.firstName, this.lastName, this.description, this.image});

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
