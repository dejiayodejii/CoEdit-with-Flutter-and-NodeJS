import 'package:collaborating_editing_app/models/user_model.dart';
import 'package:collaborating_editing_app/utils/client_helper.dart';

class DocsRepository {
  final BaseClient _client;

  DocsRepository({required BaseClient client}) : _client = client;

   createDoc() async {
    try {
      final result = await _client.post('register', {});
      return UserModel.fromJson(result);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserModel> getMyDocument() async {
    try {
      final result = await _client.post('login', {});
      return UserModel.fromJson(result);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserModel> getSharedDocument() async {
    try {
      final result = await _client.post('googleSignIn', {});
      return UserModel.fromJson(result);
    } catch (e) {
      return Future.error(e);
    }
  }
}
