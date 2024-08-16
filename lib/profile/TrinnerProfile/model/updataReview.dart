class UpdataReview {
  String? message;
  Rating? rating;
  bool? status;

  UpdataReview({this.message, this.rating, this.status});

  UpdataReview.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? rating;
  String? review;
  int? trainerId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Rating(
      {this.id,
      this.rating,
      this.review,
      this.trainerId,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    review = json['review'];
    trainerId = json['trainer_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['trainer_id'] = this.trainerId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
