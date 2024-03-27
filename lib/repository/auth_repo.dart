import 'package:collaborating_editing_app/models/user_model.dart';
import 'package:collaborating_editing_app/utils/client_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(client: BaseClient()),
);

class AuthRepository {
  final BaseClient _client;

  AuthRepository({required BaseClient client}) : _client = client;

  Future<UserModel> registration(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber}) async {
    try {
      final result = await _client.post('auth/register', {
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        'name': name
      });
      return UserModel.fromJson(result);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserModel> login(
      {required String email, required String password}) async {
    try {
      final result = await _client.post('auth/login', {
        "email": email,
        "password": password,
      });
      return UserModel.fromJson(result);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserModel> googleSign() async {
    try {
      final result = await _client.post('googleSignIn', {});
      return UserModel.fromJson(result);
    } catch (e) {
      return Future.error(e);
    }
  }
}
