class AddBidModel {
  String? message;
  Data? data;
  bool? status;

  AddBidModel({this.message, this.data, this.status});

  AddBidModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? offeredPrice;
  String? auctionId;
  int? profileId;

  Data({this.offeredPrice, this.auctionId, this.profileId});

  Data.fromJson(Map<String, dynamic> json) {
    offeredPrice = json['offeredPrice'];
    auctionId = json['auction_id'];
    profileId = json['profile_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offeredPrice'] = this.offeredPrice;
    data['auction_id'] = this.auctionId;
    data['profile_id'] = this.profileId;
    return data;
  }
}
