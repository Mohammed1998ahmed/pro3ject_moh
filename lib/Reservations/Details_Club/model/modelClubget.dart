// class clubProfileGetModel {
// 	String? message;
// 	Club? club;
// 	List<List>? images;
// 	bool? status;

// 	clubProfileGetModel({this.message, this.club, this.images, this.status});

// 	clubProfileGetModel.fromJson(Map<String, dynamic> json) {
// 		message = json['message'];
// 		club = json['club'] != null ? new Club.fromJson(json['club']) : null;
// 		if (json['images'] != null) {
// 			images = <List>[];
// 			json['images'].forEach((v) { images!.add(new List.fromJson(v)); });
// 		}
// 		status = json['status'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['message'] = this.message;
// 		if (this.club != null) {
//       data['club'] = this.club!.toJson();
//     }
// 		if (this.images != null) {
//       data['images'] = this.images!.map((v) => v.toJson()).toList();
//     }
// 		data['status'] = this.status;
// 		return data;
// 	}
// }

// class Club {
// 	int? id;
// 	String? name;
// 	String? address;
// 	String? description;
// 	String? license;
// 	String? website;
// 	String? lat;
// 	String? long;

// 	Club({this.id, this.name, this.address, this.description, this.license, this.website, this.lat, this.long});

// 	Club.fromJson(Map<String, dynamic> json) {
// 		id = json['id'];
// 		name = json['name'];
// 		address = json['address'];
// 		description = json['description'];
// 		license = json['license'];
// 		website = json['website'];
// 		lat = json['lat'];
// 		long = json['long'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['id'] = this.id;
// 		data['name'] = this.name;
// 		data['address'] = this.address;
// 		data['description'] = this.description;
// 		data['license'] = this.license;
// 		data['website'] = this.website;
// 		data['lat'] = this.lat;
// 		data['long'] = this.long;
// 		return data;
// 	}
// }

// class Images {

// 	Images({});

// 	Images.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		return data;
// 	}
// }
// To parse this JSON data, do
//
//     final ckubModel = ckubModelFromJson(jsonString);
class ClubProfileGetModel {
  String? message;
  Club? club;
  List<String>? images;
  bool? status;

  ClubProfileGetModel({this.message, this.club, this.images, this.status});

  ClubProfileGetModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    club = json['club'] != null ? new Club.fromJson(json['club']) : null;
    images = json['images'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
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
  String? license;
  String? website;
  String? lat;
  String? long;

  Club(
      {this.id,
      this.name,
      this.address,
      this.description,
      this.license,
      this.website,
      this.lat,
      this.long});

  Club.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    description = json['description'];
    license = json['license'];
    website = json['website'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['description'] = this.description;
    data['license'] = this.license;
    data['website'] = this.website;
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}
