import 'package:hive/hive.dart';

final Map<KeysEnum, String> boxMap = {KeysEnum.accessToken: 'access_token'};

enum KeysEnum { accessToken }

class StorageService {
  static final StorageService _instance = StorageService._internal();

  static StorageService get instance => _instance;

  late Box _box;

  StorageService._internal();

  Future<void> delete(KeysEnum key) async => await _box.delete(boxMap[key]);

  Future<T> get<T>(KeysEnum key) async => await _box.get(boxMap[key]);

  Future<void> init() async {
    _box = await Hive.openBox('App');
  }

  Future<void> set(KeysEnum key, String value) async =>
      await _box.put(boxMap[key], value);
}
