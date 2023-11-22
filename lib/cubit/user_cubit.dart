import 'package:bloc/bloc.dart';
import 'package:btl/data/login_request.dart';
import 'package:btl/repository/user_repo_impl.dart';
import 'package:btl/repository/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserRepository userRepository = UserRepositoryImplement();
  UserCubit() : super(UserInitial());
  void loginRequest(LoginRequest loginRequest) async {
    final response = await userRepository.loginRequest(loginRequest);
    if (response.code == "LOGIN000") {
      emit(LoginAdminSuccess());
    }
    if (response.code == "LOGIN001") {
      emit(LoginUserSuccess());
    }
    if (response.code == "LOGIN002") {
      emit(LoginNotPermission());
    }
    if (response.code == "LOGIN003") {
      emit(LoginFailed());
    } else {
      emit(LoginFailed());
    }
  }
}
