import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _siDoCode = '';
  String get siDoCode => _siDoCode;
  set siDoCode(String value) {
    _siDoCode = value;
  }

  String _category = '';
  String get category => _category;
  set category(String value) {
    _category = value;
  }

  int _noOfRooms = 0;
  int get noOfRooms => _noOfRooms;
  set noOfRooms(int value) {
    _noOfRooms = value;
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String _sggNm = '';
  String get sggNm => _sggNm;
  set sggNm(String value) {
    _sggNm = value;
  }

  final _categoriesManager = FutureRequestManager<List<CategoriesRecord>>();
  Future<List<CategoriesRecord>> categories({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _categoriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoriesCache() => _categoriesManager.clear();
  void clearCategoriesCacheKey(String? uniqueKey) =>
      _categoriesManager.clearRequest(uniqueKey);

  final _searchCategoriesManager =
      StreamRequestManager<List<CategoriesRecord>>();
  Stream<List<CategoriesRecord>> searchCategories({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _searchCategoriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSearchCategoriesCache() => _searchCategoriesManager.clear();
  void clearSearchCategoriesCacheKey(String? uniqueKey) =>
      _searchCategoriesManager.clearRequest(uniqueKey);

  final _mapListManager = StreamRequestManager<List<HouseRecord>>();
  Stream<List<HouseRecord>> mapList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<HouseRecord>> Function() requestFn,
  }) =>
      _mapListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMapListCache() => _mapListManager.clear();
  void clearMapListCacheKey(String? uniqueKey) =>
      _mapListManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
