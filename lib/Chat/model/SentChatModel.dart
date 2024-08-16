class ChatModelSent {
  Message? message1;
  bool? success;
  String? message;

  ChatModelSent({this.message1, this.success, this.message});

  ChatModelSent.fromJson(Map<String, dynamic> json) {
    message1 = json['0'] != null ? new Message.fromJson(json['0']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message1 != null) {
      data['0'] = this.message1!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Message {
  String? image;
  String? userId;
  String? trainerId;
  String? content;
  String? role;
  String? updatedAt;
  String? createdAt;
  int? id;

  Message(
      {this.image,
      this.userId,
      this.trainerId,
      this.content,
      this.role,
      this.updatedAt,
      this.createdAt,
      this.id});

  Message.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    userId = json['user_id'];
    trainerId = json['trainer_id'];
    content = json['content'];
    role = json['role'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['trainer_id'] = this.trainerId;
    data['content'] = this.content;
    data['role'] = this.role;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
