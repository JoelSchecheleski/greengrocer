import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? fullname;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? token;

  UserModel({
    this.id,
    this.fullname,
    this.email,
    this.phone,
    this.cpf,
    this.password,
    this.token,
  });

  @override
  String toString() {
    return 'UserModel{id: $id, fullname: $fullname, email: $email, '
        'phone: $phone, cpf: $cpf, password: $password, '
        'token: $token}';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'password': password,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      fullname: map['fullname'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      cpf: map['cpf'] as String,
      password: map['password'] as String,
      token: map['token'] as String,
    );
  }
}
