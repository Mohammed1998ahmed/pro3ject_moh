class PostSendRevewModel {
  String? message;
  Rating? rating;
  bool? status;

  PostSendRevewModel({this.message, this.rating, this.status});

  PostSendRevewModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Rating {
  String? clubId;
  String? userId;
  String? rating;
  String? review;
  String? updatedAt;
  String? createdAt;
  int? id;

  Rating(
      {this.clubId,
      this.userId,
      this.rating,
      this.review,
      this.updatedAt,
      this.createdAt,
      this.id});

  Rating.fromJson(Map<String, dynamic> json) {
    clubId = json['club_id'];
    userId = json['user_id'];
    rating = json['rating'];
    review = json['review'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['club_id'] = this.clubId;
    data['user_id'] = this.userId;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
