// // part of 'auth_cubit.dart';

// // abstract class AuthState {}

// // class AuthInitial extends AuthState {}

// // class AuthLoading extends AuthState {}

// // class AuthSuccess extends AuthState {}

// // class AuthError extends AuthState {
// //   String? message;
// //   AuthError({this.message});
// // }
// part of 'auth_bloc.dart';

// sealed class AuthState {}

// final class AuthInitial extends AuthState {}

// abstract class AuthActionState extends AuthState {}

// class AuthErrorState extends AuthActionState {
//   final String error;
//   AuthErrorState({required this.error});
// }

// class AuthLoading extends AuthState {}

// class AuthSuccessState extends AuthActionState {}
// auth_state.dart
import 'package:paint_shop/delte/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;
  AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
