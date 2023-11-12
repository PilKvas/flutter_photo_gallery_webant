import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/presentation/screens/gallery_grid_screen.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/data/services/user_data_service.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/presentation/provider/user_data_provider.dart';
import 'package:flutter_photo_gallery_webant/theme/light_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 532),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ChangeNotifierProvider<PhotoItemProvider>(
          create: (context) => PhotoItemProvider(
            apiCall: GetIt.instance.get<UserItemService>(),
          ),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'WebAnt Gallery',
              theme: lightTheme,
              themeMode: ThemeMode.light,
              home: child),
        );
      },
      child: const GalleryGridPage(),
    );
  }
}
