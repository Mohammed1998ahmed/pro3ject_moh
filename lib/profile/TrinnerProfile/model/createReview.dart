class CreateReview {
  String? message;
  Rating? rating;
  bool? status;

  CreateReview({this.message, this.rating, this.status});

  CreateReview.fromJson(Map<String, dynamic> json) {
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
  String? trainerId;
  String? userId;
  String? rating;
  String? review;
  String? updatedAt;
  String? createdAt;
  int? id;

  Rating(
      {this.trainerId,
      this.userId,
      this.rating,
      this.review,
      this.updatedAt,
      this.createdAt,
      this.id});

  Rating.fromJson(Map<String, dynamic> json) {
    trainerId = json['trainer_id'];
    userId = json['user_id'];
    rating = json['rating'];
    review = json['review'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trainer_id'] = this.trainerId;
    data['user_id'] = this.userId;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
