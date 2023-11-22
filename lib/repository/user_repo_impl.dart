import 'dart:convert';

import 'package:btl/data/login_request.dart';
import 'package:btl/data/login_response.dart';
import 'package:btl/repository/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImplement implements UserRepository {
  @override
  Future<LoginResponse> loginRequest(LoginRequest loginRequest) async {
    final Dio dio = Dio(BaseOptions(baseUrl: "http://13.212.37.229:8080"));
    try {
      final response =
          await dio.post("/api/login", data: loginRequest.toJson());
      if (response.statusCode == 200) {
        String jsonString = response.data;
        Map<String, dynamic> jsonData = jsonDecode(jsonString);
        return LoginResponse.fromJson(jsonData);
      } else {
        return LoginResponse(code: "Failed");
      }
    } catch (e) {
      return LoginResponse(code: "Failed");
    }
  }
}
