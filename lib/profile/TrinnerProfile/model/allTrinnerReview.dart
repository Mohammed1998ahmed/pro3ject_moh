class AllTrinnerReview {
  List<Ratings>? ratings;
  bool? status;

  AllTrinnerReview({this.ratings, this.status});

  AllTrinnerReview.fromJson(Map<String, dynamic> json) {
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(new Ratings.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ratings != null) {
      data['ratings'] = this.ratings!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Ratings {
  int? id;
  int? rating;
  String? review;
  int? trainerId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Ratings(
      {this.id,
      this.rating,
      this.review,
      this.trainerId,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Ratings.fromJson(Map<String, dynamic> json) {
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
