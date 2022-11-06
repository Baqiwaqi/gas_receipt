import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gas_receipt/features/authentication/model/login_model.dart';

import '../repositories/auth_error_repository.dart';
import '../repositories/auth_repository.dart';

part 'auth_screen_state.dart';

class AuthScreenCubit extends Cubit<AuthScreenState> {
  AuthScreenCubit(this._authenticationRepository) : super(AuthScreenLogin());

  final AuthenticationRepository _authenticationRepository;

  void login() => emit(AuthScreenLogin());

  void register() => emit(AuthScreenRegister());

  void togglePasswordVisibility(LoginModel? login, bool isVisible) {
    emit(AuthScreenLoginVisibility(login: login!, isVisible: isVisible));
  }

  void togglePasswordVisibilityRegister(
      RegisterModel? register, bool isVisible) {
    emit(AuthScreenRegisterVisibility(
        register: register!, isVisible: isVisible));
  }

  // login with credentials
  Future<void> logInWithCredentials(LoginModel login) async {
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: login.email!,
        password: login.password!,
      );
      emit(AuthScreenLogin());
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(LoginFailure(message: e.message));
    } catch (_) {
      emit(const LoginFailure(message: "Login failed"));
    }
  }

  // login with google
  Future<void> logInWithGoogle() async {
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(AuthScreenLogin());
    } on LogInWithGoogleFailure catch (e) {
      emit(LoginFailure(message: e.message));
    } catch (_) {
      emit(const LoginFailure(message: "Login failed"));
    }
  }

  // creates a new account
  Future<void> signUpWithCredentials(RegisterModel register) async {
    try {
      await _authenticationRepository.signUpEmailAndPassword(
        email: register.email!,
        password: register.password!,
      );
      emit(AuthScreenLogin());
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(RegisterFailure(message: e.message));
    } catch (_) {
      emit(const RegisterFailure(message: "Sign up failed"));
    }
  }
}
