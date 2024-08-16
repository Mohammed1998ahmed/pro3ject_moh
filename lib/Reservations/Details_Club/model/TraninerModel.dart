class TrinerProfileGetModel {
  String? message;
  List<Trainers>? trainers;
  bool? status;

  TrinerProfileGetModel({this.message, this.trainers, this.status});

  TrinerProfileGetModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['trainers'] != null) {
      trainers = <Trainers>[];
      json['trainers'].forEach((v) {
        trainers!.add(new Trainers.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.trainers != null) {
      data['trainers'] = this.trainers!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Trainers {
  String? fName;
  String? lName;
  String? birth;
  String? gender;
  String? address;
  String? license;
  String? image;
  String? qualifications;
  String? certifications;
  int? experience;
  String? specialties;
  int? clubId;

  Trainers(
      {this.fName,
      this.lName,
      this.birth,
      this.gender,
      this.address,
      this.license,
      this.image,
      this.qualifications,
      this.certifications,
      this.experience,
      this.specialties,
      this.clubId});

  Trainers.fromJson(Map<String, dynamic> json) {
    fName = json['FName'];
    lName = json['lName'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    license = json['license'];
    image = json['image'];
    qualifications = json['qualifications'];
    certifications = json['certifications'];
    experience = json['experience'];
    specialties = json['specialties'];
    clubId = json['club_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FName'] = this.fName;
    data['lName'] = this.lName;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['license'] = this.license;
    data['image'] = this.image;
    data['qualifications'] = this.qualifications;
    data['certifications'] = this.certifications;
    data['experience'] = this.experience;
    data['specialties'] = this.specialties;
    data['club_id'] = this.clubId;
    return data;
  }
}
