class GetSearchHealthModel {
  String? message;
  List<HealthCares>? healthCares;
  bool? status;

  GetSearchHealthModel({this.message, this.healthCares, this.status});

  GetSearchHealthModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['HealthCares'] != null) {
      healthCares = <HealthCares>[];
      json['HealthCares'].forEach((v) {
        healthCares!.add(new HealthCares.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.healthCares != null) {
      data['HealthCares'] = this.healthCares!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class HealthCares {
  int? id;
  String? name;
  String? address;
  String? description;
  String? profileImage;
  String? license;
  String? website;
  String? lat;
  String? long;
  List<String>? day;
  String? start;
  String? end;
  int? userId;

  HealthCares(
      {this.id,
      this.name,
      this.address,
      this.description,
      this.profileImage,
      this.license,
      this.website,
      this.lat,
      this.long,
      this.day,
      this.start,
      this.end,
      this.userId});

  HealthCares.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    description = json['description'];
    profileImage = json['profile_image'];
    license = json['license'];
    website = json['website'];
    lat = json['lat'];
    long = json['long'];
    day = json['day'].cast<String>();
    start = json['start'];
    end = json['end'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['description'] = this.description;
    data['profile_image'] = this.profileImage;
    data['license'] = this.license;
    data['website'] = this.website;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['day'] = this.day;
    data['start'] = this.start;
    data['end'] = this.end;
    data['user_id'] = this.userId;
    return data;
  }
}
