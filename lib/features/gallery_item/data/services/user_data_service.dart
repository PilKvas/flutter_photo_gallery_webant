import 'package:dio/dio.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/data/entities/user_data.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/data/repo/user_data_repo.dart';

class UserItemService implements UserDataRepo{
  static const baseURL = 'https://gallery.prod1.webant.ru';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: baseURL),
  );

  @override
  Future<UserData> getUser({required user}) async {
    final response = await _dio.get(
      user,
    );
    final data = response.data as Map<String, dynamic>;
    return UserData(userName: data['username'], roles: data['roles']);
  }
}
