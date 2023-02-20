class UserModel {
  String? sId;
  String? email;
  String? username;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel(
      {this.sId,
        this.email,
        this.username,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}