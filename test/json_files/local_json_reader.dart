import 'dart:io';

class FileReader {
  String readJson(String name) {
    return File('test/json_files/$name.json').readAsStringSync();
  }
}
