// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LeaderPlayerModel {
  final String userId;
  final String userName;
  final int rank;
  final int points;
  LeaderPlayerModel({
    required this.userId,
    required this.userName,
    required this.rank,
    required this.points,
  });

  LeaderPlayerModel copyWith({
    String? userId,
    String? userName,
    int? rank,
    int? points,
  }) {
    return LeaderPlayerModel(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      rank: rank ?? this.rank,
      points: points ?? this.points,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'rank': rank,
      'points': points,
    };
  }

  factory LeaderPlayerModel.fromMap(Map<String, dynamic> map) {
    return LeaderPlayerModel(
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      rank: map['rank'] as int,
      points: map['points'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LeaderPlayerModel.fromJson(String source) =>
      LeaderPlayerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LeaderPlayerModel(userId: $userId, userName: $userName, rank: $rank, points: $points)';
  }

  @override
  bool operator ==(covariant LeaderPlayerModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.userName == userName &&
        other.rank == rank &&
        other.points == points;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        userName.hashCode ^
        rank.hashCode ^
        points.hashCode;
  }
}
