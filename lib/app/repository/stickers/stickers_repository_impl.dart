import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/models/register_sticker_model.dart';
import 'package:fwc_album_app/app/models/sticker_model.dart';

import './stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;

  StickersRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GroupsStickers>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');
      return result.data
          .map<GroupsStickers>((g) => GroupsStickers.fromMap(g))
          .toList();
    } on DioError catch (e, s) {
      log('Error fetching user album', error: e, stackTrace: s);
      throw RepositoryException(message: 'Error fetching user album');
    }
  }

  @override
  Future<StickerModel?> findStickerbyCode(
      String stickerCode, String stickerNumber) async {
    try {
      final result = await dio.auth().get('/api/sticker-search',
          queryParameters: {
            'sticker_code': stickerCode,
            'sticker-number': stickerNumber
          });

      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      log('Error when searching for sticker', error: e, stackTrace: s);
      throw RepositoryException(message: 'Error when searching for sticker');
    }
  }

  @override
  Future<StickerModel> create(RegisterStickerModel registerStickerModel) async {
    try {
      final body = FormData.fromMap({
        ...registerStickerModel.toMap(),
        'sticker_image_upload': '',
      });
      final result = await dio.auth().post('/api/sticker', data: body);
      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Error registering sticker in the album', error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Error registering sticker in the album');
    }
  }

  @override
  Future<void> registerUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().post('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount,
      });
    } on DioError catch (e, s) {
      log("Error when inserting a sticker in the users album",
          error: e, stackTrace: s);
      throw RepositoryException(
          message: "Error when inserting a sticker in the users album");
    }
  }

  @override
  Future<void> updateUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().put('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount,
      });
    } on DioError catch (e, s) {
      log("Error when inserting a sticker in the users album",
          error: e, stackTrace: s);
      throw RepositoryException(
          message: "Error when inserting a sticker in the users album");
    }
  }
}
