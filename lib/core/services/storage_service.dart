import 'package:hive/hive.dart';

final Map<HiveKeysEnum, String> boxMap = {
  HiveKeysEnum.accessToken: 'access_token',
};

enum HiveKeysEnum { accessToken }

class StorageService {
  static final StorageService _instance = StorageService._internal();

  static StorageService get instance => _instance;

  late Box _box;

  StorageService._internal();

  Future<void> delete(HiveKeysEnum key) async => await _box.delete(boxMap[key]);

  Future<T> get<T>(HiveKeysEnum key) async => await _box.get(boxMap[key]);

  Future<void> init() async {
    _box = await Hive.openBox('App');
  }

  Future<void> set(HiveKeysEnum key, String value) async =>
      await _box.put(boxMap[key], value);
}
