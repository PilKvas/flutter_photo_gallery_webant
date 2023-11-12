import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/data/services/photo_grid_service.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/presentation/provider/gallery_provider.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/presentation/widgets/gallery_grid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({super.key, required this.isNew});

  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      child: ChangeNotifierProvider(
        create: (context) =>
            GalleryProvider(apiService: GetIt.instance.get<PhotoGridService>()),
        child: GalleryGrid(
          isNew: isNew,
        ),
      ),
    );
  }
}
