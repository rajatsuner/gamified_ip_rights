// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LevelModel {
  final int moduleNumber;
  final int levelNumber;
  final String levelName;
  final int maxPoints;
  int? scoredPoints;
  String? status;
  LevelModel({
    required this.moduleNumber,
    required this.levelNumber,
    required this.levelName,
    required this.maxPoints,
    this.scoredPoints,
    this.status,
  });

  LevelModel copyWith({
    int? moduleNumber,
    int? levelNumber,
    String? levelName,
    int? maxPoints,
    int? scoredPoints,
    String? status,
  }) {
    return LevelModel(
      moduleNumber: moduleNumber ?? this.moduleNumber,
      levelNumber: levelNumber ?? this.levelNumber,
      levelName: levelName ?? this.levelName,
      maxPoints: maxPoints ?? this.maxPoints,
      scoredPoints: scoredPoints ?? this.scoredPoints,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'moduleNumber': moduleNumber,
      'levelNumber': levelNumber,
      'levelName': levelName,
      'maxPoints': maxPoints,
      'scoredPoints': scoredPoints,
      'status': status,
    };
  }

  factory LevelModel.fromMap(Map<String, dynamic> map) {
    return LevelModel(
      moduleNumber: map['moduleNumber'] as int,
      levelNumber: map['levelNumber'] as int,
      levelName: map['levelName'] as String,
      maxPoints: map['maxPoints'] as int,
      scoredPoints:
          map['scoredPoints'] != null ? map['scoredPoints'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LevelModel.fromJson(String source) =>
      LevelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LevelModel(moduleNumber: $moduleNumber, levelNumber: $levelNumber, levelName: $levelName, maxPoints: $maxPoints, scoredPoints: $scoredPoints, status: $status)';
  }

  @override
  bool operator ==(covariant LevelModel other) {
    if (identical(this, other)) return true;

    return other.moduleNumber == moduleNumber &&
        other.levelNumber == levelNumber &&
        other.levelName == levelName &&
        other.maxPoints == maxPoints &&
        other.scoredPoints == scoredPoints &&
        other.status == status;
  }

  @override
  int get hashCode {
    return moduleNumber.hashCode ^
        levelNumber.hashCode ^
        levelName.hashCode ^
        maxPoints.hashCode ^
        scoredPoints.hashCode ^
        status.hashCode;
  }
}
