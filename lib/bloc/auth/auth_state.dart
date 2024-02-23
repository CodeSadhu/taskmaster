part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AppleSignInProgress extends AuthState {}

final class AppleSignInSuccess extends AuthState {}

final class AppleSignInFailure extends AuthState {}
