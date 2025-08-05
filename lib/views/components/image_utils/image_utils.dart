import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<void> pickImage(Function(File) onPicked) async {
  final picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    onPicked(File(pickedFile.path));
  }
}
