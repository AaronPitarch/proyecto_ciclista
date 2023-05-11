import 'package:image_picker/image_picker.dart';

Future<XFile?> getImage() async {
  final ImagePicker picker = ImagePicker();

  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  final XFile? photo = await picker.pickImage(source: ImageSource.camera);

  return image;
}