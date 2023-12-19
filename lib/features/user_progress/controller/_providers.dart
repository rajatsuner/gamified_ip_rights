import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/common/repository/api_repo.dart';
import 'package:gamified_ip_rights/features/user_progress/model/model_progress_model.dart';

final userBadgesProvider = StateProvider((ref) => []);

final userStatisticsProvider = StateProvider((ref) => null);

final moduleProgressProvider =
    StateProvider<List<ModuleProgressModel>>((ref) => []);
