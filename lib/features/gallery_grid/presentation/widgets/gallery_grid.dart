import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/presentation/provider/gallery_provider.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/presentation/widgets/shimmer_widget.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/presentation/screens/photo_item_screen.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/presentation/widgets/no_internet_connection_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

class GalleryGrid extends StatefulWidget {
  const GalleryGrid({
    super.key,
    required this.isNew,
  });

  final bool isNew;

  @override
  State<GalleryGrid> createState() => _GalleryGridState();
}

class _GalleryGridState extends State<GalleryGrid> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void fetchData() {
    Provider.of<GalleryProvider>(context, listen: false)
        .callGalleryApi(widget.isNew);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      return Consumer<GalleryProvider>(builder: (context, data, __) {
        if (data.isLoading == GridLoadingState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () =>
                      Provider.of<GalleryProvider>(context, listen: false)
                          .onRefresh(widget.isNew),
                  child: data.hasInternet
                      ? GridView.builder(
                          controller: _scrollController,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisCount:
                                orientation == Orientation.portrait ? 2 : 3,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.4,
                          ),
                          itemCount: data.gallery.length + 2,
                          itemBuilder: (context, index) {
                            if (index < data.gallery.length) {
                              return GestureDetector(
                                onTap: () {
                                  Provider.of<GalleryProvider>(context,
                                          listen: false)
                                      .callGalleryApi(widget.isNew);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.r),
                                  child: data.gallery[index].image != null &&
                                          data.gallery[index].user != null
                                      ? GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => PhotoItem(
                                                  imageUrl: data.gallery[index]
                                                      .image!.imageUrl,
                                                  title:
                                                      data.gallery[index].name,
                                                  date: data
                                                      .gallery[index].dateCreate,
                                                  discription: data
                                                      .gallery[index]
                                                      .description,
                                                  user: data.gallery[index].user,
                                                ),
                                              ),
                                            );
                                          },
                                          child: CachedNetworkImage(
                                            imageUrl: data
                                                .gallery[index].image!.imageUrl,
                                            errorWidget: (context, url, error) {
                                              return const Icon(
                                                Icons.error_outline,
                                                color: Colors.red,
                                              );
                                            },
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : const Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                        ),
                                ),
                              );
                            } else if (data.page < data.countOfPage) {
                              return ShimmerWidget(
                                width: 160.w,
                                height: 100.h,
                              );
                            }
                            return null;
                          },
                        )
                      : const NoInternetConnectionWidget(),
                ),
              ),
            ],
          );
        }
      });
    });
  }
}
