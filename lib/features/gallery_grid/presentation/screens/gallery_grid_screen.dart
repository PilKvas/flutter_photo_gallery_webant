import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/presentation/widgets/tab_bar_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GalleryGridPage extends StatelessWidget {
  const GalleryGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide()),
              contentPadding: EdgeInsets.all(12.r),
              hintText: 'Search',
              suffixIcon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 237, 89, 146),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TabBar(
                indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
                tabs: const [
                  Tab(
                    text: 'New',
                  ),
                  Tab(
                    text: 'Popular',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const SafeArea(
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    TabBarItem(
                      isNew: true,
                    ),
                    TabBarItem(
                      isNew: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
