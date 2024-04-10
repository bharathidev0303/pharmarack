import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pharmarack/packages/storage_utils/storage_constants.dart';


/// A User authentication manager that stores and retrieves user credentials
/// and updates the auth headers in dio
///
/// see retailer app integration tests for acceptance criteria
class UserAuthManager {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  static const _authKey = "Authorizationdetails";
  static const authTokenKey = "Authorization";
  static const _basicValue = "Basic ";
  static const _separator = ':';
  final _storageKeyUserAuth = StorageConstants.userEncodedHeaderKey;

  UserAuthManager({required Dio dio, FlutterSecureStorage? secureStorage})
      : _dio = dio,
        _secureStorage = secureStorage ?? const FlutterSecureStorage();

  /// Saves the Base64 encoded [username] and [password] in secure storage
  /// and sets the auth headers in dio
  Future<void> saveUsernamePassword({
    required String username,
    required String password,
  }) async {
    final encodedAuth = base64.encode(
      utf8.encode(username + _separator + password),
    );
    await _secureStorage.write(
      key: _storageKeyUserAuth,
      value: encodedAuth,
    );
    setAuthHeaders(_authKey, encodedAuth);
  }

  Future<String?> getUsername() async {
    final decodedAuth = await _getDecodedAuth();
    return decodedAuth?.split(_separator).first;
  }

  Future<String?> getPassword() async {
    final decodedAuth = await _getDecodedAuth();
    return decodedAuth?.split(_separator).last;
  }

  /// Clears auth from storage and removes it from headers
  Future<void> clearAuth() async {
    await _secureStorage.delete(key: _storageKeyUserAuth);
    _removeAuthHeaders();
  }

  Future<void> clearAuthToken() async {
    await _secureStorage.delete(key: StorageConstants.authToken);
    _removeAuthHeaders();
  }

  Future<bool> setAuthToken() async {
    final loginToken =
        await _secureStorage.read(key: StorageConstants.authToken);
    if (loginToken != null) {
      setAuthHeaders(authTokenKey, loginToken);
      return true;
    } else {
      return false;
    }
  }

  /// Returns true if auth headers were set successfully
  Future<bool> refreshAuthHeader() async {
    final encodedAuth = await _secureStorage.read(key: _storageKeyUserAuth);
    if (encodedAuth != null) {
      setAuthHeaders(_authKey, encodedAuth);
      return true;
    } else {
      return false;
    }
  }

  Future<String?> _getDecodedAuth() async {
    final encodedAuth = await _secureStorage.read(key: _storageKeyUserAuth);
    if (encodedAuth == null) {
      return null;
    } else {
      return utf8.decode(base64.decode(encodedAuth));
    }
  }

  void setAuthHeaders(key, encodedAuth) {
    var basicValue = "";
    if (key == _authKey) {
      basicValue = _basicValue;
    }
    _dio.options.headers[key] = basicValue + encodedAuth;
  }

  void _removeAuthHeaders() {
    _dio.options.headers.remove(_authKey);
  }
}
