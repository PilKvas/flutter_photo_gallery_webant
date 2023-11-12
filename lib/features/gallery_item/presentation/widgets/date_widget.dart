import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/presentation/screens/photo_item_screen.dart';
import 'package:flutter_photo_gallery_webant/theme/light_theme.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.widget,
  });

  final PhotoItem widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('dd MMM. yyyy').format(
        DateTime.parse(widget.date),
      ),
      style: Theme.of(context).textTheme.itemDate,
    );
  }
}
