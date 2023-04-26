import 'package:localstorage/localstorage.dart';

final LocalStorage storage = new LocalStorage('local_data_app');

class LibLocalStorage {
  String get(String key) {
    return (key.isNotEmpty) ? storage.getItem(key) : null;
  }

  bool set(String key, String value) {
    if (key.isNotEmpty && value.isNotEmpty) {
      storage.setItem(key, value);
      return true;
    }
    return false;
  }

  bool remove(String key) {
    if (key.isNotEmpty) {
      storage.deleteItem(key);
      return true;
    }
    return false;
  }
}
