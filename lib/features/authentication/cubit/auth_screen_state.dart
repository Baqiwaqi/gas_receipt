part of 'auth_screen_cubit.dart';

abstract class AuthScreenState extends Equatable {
  const AuthScreenState();

  @override
  List<Object> get props => [];
}

class AuthScreenLogin extends AuthScreenState {}

class AuthScreenRegister extends AuthScreenState {}

class AuthScreenLoginVisibility extends AuthScreenState {
  const AuthScreenLoginVisibility({required this.login, required this.isVisible});
  final LoginModel login;
  final bool isVisible;

  @override
  List<Object> get props => [login, isVisible];
}

class AuthScreenRegisterVisibility extends AuthScreenState {
  const AuthScreenRegisterVisibility({required this.register, required this.isVisible});
  final RegisterModel register;
  final bool isVisible;

  @override
  List<Object> get props => [register, isVisible];
}

class LoginFailure extends AuthScreenState {
  const LoginFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

class RegisterFailure extends AuthScreenState {
  const RegisterFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
