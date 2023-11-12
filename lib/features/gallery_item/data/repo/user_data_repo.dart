

import 'package:flutter_photo_gallery_webant/features/gallery_item/data/entities/user_data.dart';

abstract class UserDataRepo{
  Future<UserData> getUser({required user});
}