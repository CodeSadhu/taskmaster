import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AppleAuthRequested>(_onAppleAuthRequested);
  }

  void _onAppleAuthRequested(
      AppleAuthRequested event, Emitter<AuthState> emitter) async {
    emitter(AppleSignInProgress());

    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      emitter(AppleSignInSuccess());
    } catch (e) {
      emitter(AppleSignInFailure());
    }
  }
}
