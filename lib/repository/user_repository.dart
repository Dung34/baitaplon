import 'package:btl/data/login_request.dart';
import 'package:btl/data/login_response.dart';

abstract class UserRepository {
  Future<LoginResponse> loginRequest(LoginRequest loginRequest);
}
