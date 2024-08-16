class ListChatsTrinnerModel {
  List<ChatList>? chatList;
  bool? status;

  ListChatsTrinnerModel({this.chatList, this.status});

  ListChatsTrinnerModel.fromJson(Map<String, dynamic> json) {
    if (json['chatList'] != null) {
      chatList = <ChatList>[];
      json['chatList'].forEach((v) {
        chatList!.add(new ChatList.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chatList != null) {
      data['chatList'] = this.chatList!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class ChatList {
  int? trainerId;
  String? trainerName;
  String? trainerImage;
  String? lastMessage;
  String? lastMessageTime;
  int? unreadMessages;

  ChatList(
      {this.trainerId,
      this.trainerName,
      this.trainerImage,
      this.lastMessage,
      this.lastMessageTime,
      this.unreadMessages});

  ChatList.fromJson(Map<String, dynamic> json) {
    trainerId = json['trainer_id'];
    trainerName = json['trainer_name'];
    trainerImage = json['trainer_image'];
    lastMessage = json['last_message'];
    lastMessageTime = json['last_message_time'];
    unreadMessages = json['unread_messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trainer_id'] = this.trainerId;
    data['trainer_name'] = this.trainerName;
    data['trainer_image'] = this.trainerImage;
    data['last_message'] = this.lastMessage;
    data['last_message_time'] = this.lastMessageTime;
    data['unread_messages'] = this.unreadMessages;
    return data;
  }
}
