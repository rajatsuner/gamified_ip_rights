// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String userId;
  final String? userName;
  final String? diceCode;
  final int? age;
  final String? email;
  UserModel({
    required this.userId,
    this.userName,
    this.diceCode,
    this.age,
    this.email,
  });

  UserModel copyWith({
    String? userId,
    String? userName,
    String? diceCode,
    int? age,
    String? email,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      diceCode: diceCode ?? this.diceCode,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'diceCode': diceCode,
      'age': age,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      userName: map['userName'] != null ? map['userName'] as String : null,
      diceCode: map['diceCode'] != null ? map['diceCode'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(userId: $userId, userName: $userName, diceCode: $diceCode, age: $age, email: $email)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.userName == userName &&
        other.diceCode == diceCode &&
        other.age == age &&
        other.email == email;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        userName.hashCode ^
        diceCode.hashCode ^
        age.hashCode ^
        email.hashCode;
  }
}
