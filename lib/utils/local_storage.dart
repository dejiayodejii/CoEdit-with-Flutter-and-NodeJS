
import 'dart:convert';

import 'package:collaborating_editing_app/models/user_model.dart';
import 'package:collaborating_editing_app/utils/secure_storage.dart';

class VSecureKeys {
  static const String userKey = 'vuser';
  static const String userTokenKey = 'token';
  static const String restTokenKey = 'restToken';
  static const String userIdPk = 'pk';
  static const String username = 'username';
  static const String savedAuthStatus = 'auth_status';
  static const String biometricEnabled = 'biometric_enabled';
}

class LocalDb {
  LocalDb._();
  final CdSecureStorage storage = CdSecureStorage();

  static LocalDb inst = LocalDb._();

  //get user details
  Future<UserModel?> getUserModel() async {
    final userDetails =
        await storage.getSecuredKeyStoreData(VSecureKeys.userKey);
    if(userDetails != null){
    return  UserModel.fromJson(jsonDecode(userDetails));
    }
    return null;

  }

  //store user details
  storeUserModel(dynamic userCredentials) async {
    await storage.storeByKey(VSecureKeys.userKey, jsonEncode(userCredentials));
  }

  //get token
  Future<dynamic> getUserToken() {
    return storage.getSecuredKeyStoreData(VSecureKeys.userTokenKey);
  }

  deleteAll() async {
    await storage.storage.deleteAll();
  }

  //store user credentials
  setRestToken(String token) async {
    await storage.storeByKey(VSecureKeys.restTokenKey, token);
  }

  setUserToken(dynamic token) async {
    await storage.storeByKey(VSecureKeys.userTokenKey, token);
  }

}
