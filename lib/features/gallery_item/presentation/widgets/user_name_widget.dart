import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/presentation/provider/user_data_provider.dart';
import 'package:flutter_photo_gallery_webant/theme/light_theme.dart';
import 'package:provider/provider.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<PhotoItemProvider>(context, listen: true).item.userName,
      style: Theme.of(context).textTheme.itemUser,
    );
  }
}
