// ignore_for_file: camel_case_types, file_names

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class imageProvider with ChangeNotifier {
  late PickedFile _pickerFile;

  PickedFile get pickedFile => _pickerFile;

  Future<void> setImage({required PickedFile pickedFile}) async {
    _pickerFile = pickedFile;
    notifyListeners();
  }
}
