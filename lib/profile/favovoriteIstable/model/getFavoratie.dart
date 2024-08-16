class GetFavoratieModle {
  List<FavoriteClubs>? favoriteClubs;
  bool? status;

  GetFavoratieModle({this.favoriteClubs, this.status});

  GetFavoratieModle.fromJson(Map<String, dynamic> json) {
    if (json['favorite_clubs'] != null) {
      favoriteClubs = <FavoriteClubs>[];
      json['favorite_clubs'].forEach((v) {
        favoriteClubs!.add(new FavoriteClubs.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.favoriteClubs != null) {
      data['favorite_clubs'] =
          this.favoriteClubs!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class FavoriteClubs {
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
  Pivot? pivot;

  FavoriteClubs(
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
      this.userId,
      this.pivot});

  FavoriteClubs.fromJson(Map<String, dynamic> json) {
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
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? equestrianClubId;

  Pivot({this.userId, this.equestrianClubId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    equestrianClubId = json['equestrian_club_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['equestrian_club_id'] = this.equestrianClubId;
    return data;
  }
}
