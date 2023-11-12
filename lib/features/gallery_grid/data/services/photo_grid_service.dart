import 'package:dio/dio.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/data/entites/photo_grid_dto.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/data/repos/photo_grid_repo.dart';

class PhotoGridService implements PhotoGridRepo{
  static const baseURL = 'https://gallery.prod1.webant.ru';
  static const limit = 10;
  final Dio _dio = Dio(
    BaseOptions(baseUrl: baseURL),
  );
  @override
  Future<(List<PhotoGridDTO>, int)> getGallery(
      {required int page, required bool isNew}) async {
    final response = await _dio.get(
      '/api/photos',
      queryParameters: {
        'page': page,
        'limit': limit,
        'new': isNew,
      },
    );
    final data = response.data as Map<String, dynamic>;
    final int countOfPage = data['countOfPages'];
    final dataRaw = data['data'] as List<dynamic>;
    List<PhotoGridDTO> result = (dataRaw).map((i) {
      return PhotoGridDTO.fromApi(i);
    }).toList();

    return (result, countOfPage);
  }
}
