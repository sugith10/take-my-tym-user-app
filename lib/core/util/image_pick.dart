import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

/// Utility class for picking images from the device gallery.
final class ImagePick {
  /// getImage() is a future that will return a file of the image picked
  Future<File?> getImage() async {
    try {
      // pick the image from the gallery
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      // if the image is null, return null
      if (image == null) return null;
      // create a temporary file of the image
      final imageTemporary = File(image.path);
      // return the temporary file
      return imageTemporary;
    } catch (e) {
      // log the error
      log(e.toString());
    }
    // return null if there is an error or the image is null
    return null;
  }
}
