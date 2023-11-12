import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/presentation/widgets/shimmer_widget.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/presentation/provider/user_data_provider.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/presentation/widgets/widgets.dart';
import 'package:flutter_photo_gallery_webant/theme/app_colors.dart';

import 'package:flutter_photo_gallery_webant/theme/light_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

class PhotoItem extends StatefulWidget {
  const PhotoItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.date,
      required this.user,
      required this.discription});

  final String date;
  final String discription;
  final String imageUrl;
  final String title;
  final String? user;

  @override
  State<PhotoItem> createState() => _PhotoItemState();
}

class _PhotoItemState extends State<PhotoItem> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });
    super.initState();
  }

  void fetchData() {
    Provider.of<PhotoItemProvider>(context, listen: false)
        .callUserApi(user: widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.navigationButtonColor,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<PhotoItemProvider>(builder: (context, data, __) {
        return RefreshIndicator(
          onRefresh: () async {
            return fetchData();
          },
          child: data.hasInternet
              ? ListView(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 200.h,
                            child: ItemImageWidget(widget: widget),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.h, vertical: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: Theme.of(context).textTheme.itemTitle,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                data.isLoading == UserLoadingState.loading
                                    ? ShimmerWidget(width: 100.w, height: 8.h)
                                    : const UserNameWidget(),
                                SizedBox(
                                  height: 10.h,
                                ),
                                DesctiptionWidget(widget: widget),
                                SizedBox(
                                  height: 10.h,
                                ),
                                data.isLoading == UserLoadingState.loading
                                    ? ShimmerWidget(width: 120.w, height: 10.h)
                                    : RolePlayWidget(
                                        data: data,
                                      ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                DateWidget(widget: widget),
                              ],
                            ),
                          )
                        ]),
                  ],
                )
              : const NoInternetConnectionWidget(),
        );
      }),
    );
  }
}
