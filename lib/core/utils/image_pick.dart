import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

final class ImagePick {
  Future<File?> getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      final imageTemporary = File(image.path);
      return imageTemporary;
    } catch (e) {
      log(e.toString());
    }
  }
}
