class Sney3iModel {
  List<Data>? data;

  Sney3iModel({this.data});

  Sney3iModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? like;
  int? unlike;
  String? sId;
  String? email;
  String? username;
  String? password;
  String? number;
  String? photo;
  String? city;
  String? serviceType;
  String? bio;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? spec;
  int? rate;

  Data(
      {this.like,
        this.unlike,
        this.sId,
        this.email,
        this.username,
        this.password,
        this.number,
        this.photo,
        this.city,
        this.serviceType,
        this.bio,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.spec,
        this.rate});

  Data.fromJson(Map<String, dynamic> json) {
    like = json['like'];
    unlike = json['unlike'];
    sId = json['_id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    number = json['number'];
    photo = json['photo'];
    city = json['city'];
    serviceType = json['service_type'];
    bio = json['bio'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    spec = json['spec'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['like'] = this.like;
    data['unlike'] = this.unlike;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['number'] = this.number;
    data['photo'] = this.photo;
    data['city'] = this.city;
    data['service_type'] = this.serviceType;
    data['bio'] = this.bio;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['spec'] = this.spec;
    data['rate'] = this.rate;
    return data;
  }
}
