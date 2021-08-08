import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.meta,
    this.response,
  });

  Meta? meta;
  late Response? response;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    meta: Meta.fromJson(json["meta"]),
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta!.toJson(),
    "response": response!.toJson(),
  };
}

class Meta {
  Meta({
    this.status,
  });

  int? status;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}

class Response {
  Response({
    this.userList,
    this.message,
  });

  List<UserList>? userList;
  String? message;


  factory Response.fromJson(Map<String, dynamic> json) => Response(
    userList: List<UserList>.from(json["user_list"].map((x) => UserList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "user_list": List<dynamic>.from(userList!.map((x) => x.toJson())),
    "message": message,
  };
}

class UserList {
  UserList({
    this.id,
    this.name="",
    this.email,
    this.gender,
    this.phone,
    this.latitude,
    this.longitude,
    this.profileImage,
    this.emailVerifiedAt,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String name;
  String? email;
  String? gender;
  String? phone;
  String? latitude;
  String? longitude;
  String? profileImage;
  DateTime? emailVerifiedAt;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    gender: json["gender"],
    phone: json["phone"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    profileImage: json["profile_image"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    password: json["password"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "gender": gender,
    "phone": phone,
    "latitude": latitude,
    "longitude": longitude,
    "profile_image": profileImage,
    "email_verified_at": emailVerifiedAt!.toIso8601String(),
    "password": password,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}


