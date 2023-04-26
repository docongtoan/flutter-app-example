import 'dart:convert';

import 'package:localstorage/localstorage.dart';

LocalStorage? storage;

class LibLocalStorage {
  get(String key) {
    return (key.isNotEmpty) ? storage?.getItem(key) : '';
  }

  bool checkLogin(String key) {
    return (storage?.getItem(key) == null) ? false : true;
  }

  bool set(String key, String value) {
    if (key.isNotEmpty && value.isNotEmpty) {
      storage?.setItem(key, value);
      return true;
    }
    return false;
  }

  bool remove(String key) {
    if (key.isNotEmpty) {
      storage?.deleteItem(key);
      return true;
    }
    return false;
  }
}
