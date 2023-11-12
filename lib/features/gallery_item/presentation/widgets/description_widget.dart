import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/presentation/screens/photo_item_screen.dart';
import 'package:flutter_photo_gallery_webant/theme/light_theme.dart';

class DesctiptionWidget extends StatelessWidget {
  const DesctiptionWidget({
    super.key,
    required this.widget,
  });

  final PhotoItem widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.discription,
      style: Theme.of(context).textTheme.itemDescription,
    );
  }
}
