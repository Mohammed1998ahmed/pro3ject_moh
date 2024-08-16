class GetUpcomingActions {
  String? message;
  List<Dates>? dates;
  bool? status;

  GetUpcomingActions({this.message, this.dates, this.status});

  GetUpcomingActions.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(new Dates.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.dates != null) {
      data['dates'] = this.dates!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Dates {
  String? beginTime;

  Dates({this.beginTime});

  Dates.fromJson(Map<String, dynamic> json) {
    beginTime = json['begin_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['begin_time'] = this.beginTime;
    return data;
  }
}
