import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/features/auth/model/user_model.dart';

final apiRepoProvider = Provider<ApiRepo>((ref) => ApiRepo());

class ApiRepo {
  //base server url
  //final baseUrl = "http://192.168.236.251:8000/ideafibackend/";
  final baseUrl = "https://idea-fi-8c361bbcf623.herokuapp.com/ideafibackend/";
  final dio = Dio();

  //USER APIS
  Future<Response> registerUser(UserModel userModel) async {
    String endPoint = "user/register";
    final response =
        await dio.post("$baseUrl$endPoint", data: userModel.toMap());
    return response;
  }

  Future<Response> getUserInfo(String userId) async {
    String endPoint = "user/userInfo";
    final response = await dio
        .get("$baseUrl$endPoint", data: {"userId": userId}, options: Options(
      validateStatus: (status) {
        return true;
      },
    ));
    return response;
  }

  Future<Response> getRanks(String userId, String rankBasis) async {
    String endPoint = "rank/getRanks";
    final response = await dio.get("$baseUrl$endPoint",
        data: {"userId": userId, "rankBasis": rankBasis}, options: Options(
      validateStatus: (status) {
        return true;
      },
    ));
    return response;
  }

  Future<Response> getUserProgress(String userId) async {
    String endPoint = "user/getUserProgress";
    final response = await dio.get("$baseUrl$endPoint", data: {
      "userId": userId,
    }, options: Options(
      validateStatus: (status) {
        return true;
      },
    ));
    return response;
  }

  Future<Response> getModuleProgress(String userId) async {
    String endPoint = "user/getUserModuleProgress";
    final response = await dio.get("$baseUrl$endPoint", data: {
      "userId": userId,
    }, options: Options(
      validateStatus: (status) {
        return true;
      },
    ));
    print(response.data);
    return response;
  }
}
