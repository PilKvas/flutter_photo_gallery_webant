import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/presentation/screens/photo_item_screen.dart';

class ItemImageWidget extends StatelessWidget {
  const ItemImageWidget({
    super.key,
    required this.widget,
  });

  final PhotoItem widget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: MediaQuery.of(context).size.width,
      imageUrl: widget.imageUrl,
      errorWidget: (context, url, error) {
        return const Icon(
          Icons.error_outline,
          color: Colors.red,
        );
      },
      fit: BoxFit.fill,
    );
  }
}
