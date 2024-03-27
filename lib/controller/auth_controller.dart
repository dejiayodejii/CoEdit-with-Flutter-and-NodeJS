import 'package:collaborating_editing_app/models/user_model.dart';
import 'package:collaborating_editing_app/repository/auth_repo.dart';
import 'package:collaborating_editing_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/toast_service.dart';

final authProvider =
    AsyncNotifierProvider<AuthController, AuthStatus>(AuthController.new);

final userProvider = StateProvider<UserModel?>((ref) => null);

class AuthController extends AsyncNotifier<AuthStatus> {
  late AuthRepository _authRepo;
  late LocalDb _localDb;

  @override
  build() async {
    _authRepo = ref.watch(authRepositoryProvider);
    _localDb = LocalDb.inst;
    return AuthStatus.unauthenticated;
  }

  registration(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber,
      required Function onSuccess,


      }) async {
    try {
      state = const AsyncLoading();

      await Future.delayed(const Duration(seconds: 2));
      final result = await _authRepo.registration(
          name: name,
          email: email,
          password: password,
          phoneNumber: phoneNumber);

      ref.read(userProvider.notifier).update((state) => result);
      _localDb.storeUserModel(result.toJson());
      state = const AsyncData(AuthStatus.authenticated);
      ToastService.showSuccess(result.message);
      onSuccess();
    } catch (e, s) {
      state = AsyncError(e, s);
      debugPrint(e.toString());
      ToastService.showError(e.toString());
    }
  }

  login({required String email, required String password, required Function onSuccess}) async {
    try {
      state = const AsyncLoading();
      await Future.delayed(const Duration(seconds: 2));
      final result = await _authRepo.login(email: email, password: password);
      ref.read(userProvider.notifier).update((state) => result);
      _localDb.storeUserModel(result.toJson());
      state = const AsyncData(AuthStatus.authenticated);
      onSuccess();
    } catch (e, s) {
      state = AsyncError(e, s);
      debugPrint(e.toString());
       ToastService.showError(e);
    }
  }


  logout(){
    _localDb.deleteAll();
    ref.read(userProvider.notifier).update((state) => null);
    //set userProvider to null
    //clear local storage too
  }
}


enum AuthStatus {
  authenticated,
  unauthenticated,
}

