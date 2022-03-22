import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.status = '',
    required this.result,
  });

  String status;
  Result result;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    this.name = '',
    this.middleName = '',
    this.lastName = '',
    this.imagewithurl = '',
  });

  String name;
  String middleName;
  String lastName;
  String imagewithurl;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        imagewithurl: json["imagewithurl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "middle_name": middleName,
        "last_name": lastName,
        "imagewithurl": imagewithurl,
      };
}
