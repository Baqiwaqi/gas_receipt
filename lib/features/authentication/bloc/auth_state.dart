part of 'auth_bloc.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthState extends Equatable {
  const AuthState._({
    required this.status,
    this.user = User.empty,
  });

  final AuthStatus status;
  final User user;

  const AuthState.authenticated(User user) : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated() : this._(status: AuthStatus.unauthenticated);
  @override
  List<Object?> get props => [status, user];
}
// abstract class AuthState extends Equatable {
//   const AuthState();
  
//   @override
//   List<Object> get props => [];
// }

// class AuthInitial extends AuthState {}
