import 'package:flutter_photo_gallery_webant/features/gallery_grid/data/entites/photo_grid_dto.dart';

abstract class PhotoGridRepo {
  Future<(List<PhotoGridDTO>, int)> getGallery(
      {required int page, required bool isNew});
}
