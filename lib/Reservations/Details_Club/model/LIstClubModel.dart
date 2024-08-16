
class ListClubModel {
    List<Data>? data;
    bool? status;

    ListClubModel({this.data, this.status});

    ListClubModel.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        _data["status"] = status;
        return _data;
    }
}

class Data {
    int? id;
    String? name;
    String? address;
    String? description;
    String? license;
    String? website;
    String? lat;
    String? long;

    Data({this.id, this.name, this.address, this.description, this.license, this.website, this.lat, this.long});

    Data.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        address = json["address"];
        description = json["description"];
        license = json["license"];
        website = json["website"];
        lat = json["lat"];
        long = json["long"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["address"] = address;
        _data["description"] = description;
        _data["license"] = license;
        _data["website"] = website;
        _data["lat"] = lat;
        _data["long"] = long;
        return _data;
    }
}