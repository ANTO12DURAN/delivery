// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {

  //variables
  String? id;
  String? name;
  String? lastname;
  String? email;
  String? phone;
  String? password;
  String? sessionToken;
  String? image;

  //constructor - inicializa variables
  User({
     this.name,
     this.id,
     this.lastname,
     this.email,
     this.phone,
     this.password,
     this.sessionToken,
     this.image,
  });

  //recibe un mapa de valores y los retorna en objeto user
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    sessionToken: json["session_token"],
    image: json["image"],
  );

  //objeto que toma el user y los transforma en json
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "password": password,
    "session_token": sessionToken,
    "image": image,
  };
}