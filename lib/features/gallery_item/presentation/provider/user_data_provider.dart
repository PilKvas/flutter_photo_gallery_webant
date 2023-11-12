import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/data/entities/user_data.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/data/services/user_data_service.dart';

enum UserLoadingState {
  loading,
  loaded,
}

class PhotoItemProvider extends ChangeNotifier {
  PhotoItemProvider({required this.apiCall});

  final UserItemService apiCall;
  bool _hasInternet = true;
  UserLoadingState _isLoading = UserLoadingState.loading;
  UserData item = UserData(userName: '', roles: []);

  UserLoadingState get isLoading => _isLoading;

  bool get hasInternet => _hasInternet;

  Future<void> callUserApi({required user}) async {
    _isLoading = UserLoadingState.loading;
    await checkInternetConnectivity();
    if (_hasInternet) {
      item = await apiCall.getUser(user: user);
      _isLoading = UserLoadingState.loaded;
      notifyListeners();
    }
  }

  Future<void> checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      _hasInternet = false;
      notifyListeners();
    } else {
      _hasInternet = true;
      notifyListeners();
    }
  }
}
