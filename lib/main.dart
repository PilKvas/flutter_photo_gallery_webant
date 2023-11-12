import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/data/services/photo_grid_service.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/data/services/user_data_service.dart';

import 'package:flutter_photo_gallery_webant/gallery_app.dart';
import 'package:get_it/get_it.dart';

void main() async {
  GetIt.instance
      .registerLazySingleton<UserItemService>(() => UserItemService());
  GetIt.instance
      .registerLazySingleton<PhotoGridService>(() => PhotoGridService());
  runApp(const GalleryApp());
}
