import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/data/entites/photo_grid_dto.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_grid/data/services/photo_grid_service.dart';

enum GridLoadingState {
  loading,
  loaded,
}

class GalleryProvider extends ChangeNotifier {
  GalleryProvider({required this.apiService}) {
    countOfPage = 0;
  }

  final PhotoGridService apiService;
  late int countOfPage;

  final List<PhotoGridDTO> _gallery = [];
  bool _hasInternet = true;
  GridLoadingState _isLoading = GridLoadingState.loading;
  int _page = 1;

  List<PhotoGridDTO> get gallery => _gallery;

  int get page => _page;

  GridLoadingState get isLoading => _isLoading;

  bool get hasInternet => _hasInternet;

  Future<void> callGalleryApi(bool isNew) async {
    await checkInternetConnectivity();
    if (_hasInternet) {
      (List<PhotoGridDTO>, int) response =
          await apiService.getGallery(page: _page, isNew: isNew);
      _page++;
      _gallery.addAll(response.$1);
      countOfPage = response.$2;
      _isLoading = GridLoadingState.loaded;
      notifyListeners();
    } else {
      _isLoading = GridLoadingState.loaded;
    }
  }

  Future<void> onRefresh(bool isNew) async {
    _isLoading = GridLoadingState.loading;
    _page = 1;
    _gallery.clear();
    await callGalleryApi(isNew);
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
