class ClubIDModel {
  Club? club;
  List<String>? images;
  bool? status;

  ClubIDModel({this.club, this.images, this.status});

  ClubIDModel.fromJson(Map<String, dynamic> json) {
    club = json['club'] != null ? new Club.fromJson(json['club']) : null;
    images = json['images'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.club != null) {
      data['club'] = this.club!.toJson();
    }
    data['images'] = this.images;
    data['status'] = this.status;
    return data;
  }
}

class Club {
  int? id;
  String? name;
  String? address;
  String? description;
  String? profile;
  List<String>? day;
  String? start;
  String? end;
  String? license;
  String? website;
  String? lat;
  String? long;
  int? userId;

  Club(
      {this.id,
      this.name,
      this.address,
      this.description,
      this.profile,
      this.day,
      this.start,
      this.end,
      this.license,
      this.website,
      this.lat,
      this.long,
      this.userId});

  Club.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    description = json['description'];
    profile = json['profile'];
    day = json['day'].cast<String>();
    start = json['start'];
    end = json['end'];
    license = json['license'];
    website = json['website'];
    lat = json['lat'];
    long = json['long'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['description'] = this.description;
    data['profile'] = this.profile;
    data['day'] = this.day;
    data['start'] = this.start;
    data['end'] = this.end;
    data['license'] = this.license;
    data['website'] = this.website;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['user_id'] = this.userId;
    return data;
  }
}
