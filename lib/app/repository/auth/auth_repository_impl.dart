import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:fwc_album_app/app/models/register_user_model.dart';

import '../../core/rest/custom_dio.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<String> login(
      {required String email, required String password}) async {
    try {
      final result = await dio
          .post('/api/auth', data: {'email': email, 'password': password});
      final accessToken = result.data['access_token'];
      if (accessToken == null) {
        throw UnauthorizedException();
      }

      return accessToken;
    } on DioError catch (e, s) {
      log('Error when logging in', error: e, stackTrace: s);
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException();
      }
      throw RepositoryException(message: 'Error when logging in');
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(RegisterUserModel registerModel) async {
    try {
      await dio.unAuth().post(
            '/api/register',
            data: registerModel.toMap(),
          );
    } on DioError catch (e, s) {
      log('Error registering user', error: e, stackTrace: s);
      throw RepositoryException(message: 'Error registering user');
    }
  }
}
