class ChatModelGetData {
  bool? success;
  String? message;
  List<Chats>? chats;

  ChatModelGetData({this.success, this.message, this.chats});

  ChatModelGetData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats!.add(new Chats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.chats != null) {
      data['chats'] = this.chats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chats {
  int? id;
  int? userId;
  int? trainerId;
  String? content;
  String? role;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? user;
  int? trainer;
  String? time;

  Chats(
      {this.id,
      this.userId,
      this.trainerId,
      this.content,
      this.role,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.trainer,
      this.time});

  Chats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    trainerId = json['trainer_id'];
    content = json['content'];
    role = json['role'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'];
    trainer = json['trainer'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['trainer_id'] = this.trainerId;
    data['content'] = this.content;
    data['role'] = this.role;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user'] = this.user;
    data['trainer'] = this.trainer;
    data['time'] = this.time;
    return data;
  }
}
