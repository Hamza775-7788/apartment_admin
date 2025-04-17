import "dart:io";
import "dart:isolate";

import "package:flutter_image_compress/flutter_image_compress.dart";
import "package:path/path.dart" as path;
import "package:image/image.dart" as Im;
import "package:path_provider/path_provider.dart";

resizeImage(File imageFile) async {
  Directory directory = await getTemporaryDirectory();

  var result = await FlutterImageCompress.compressWithFile(
      imageFile.absolute.path,
      quality: 100);
  String name = path.basename(imageFile.path);
  String fullPath = path.join(directory.path, name);
  File file = File(fullPath);
  await file.writeAsBytes(result!);
  return file;
}

void checkSizeImage(ImageChecker message) {
  final imageDecod = Im.decodeImage(message.imageFile.readAsBytesSync());

  if ((imageDecod!.width / 2) == imageDecod.height) {
    message.sendPort.send(true);
  } else {
    message.sendPort.send(false);
  }
}

class ImageChecker {
  final SendPort sendPort;
  final File imageFile;
  ImageChecker({required this.sendPort, required this.imageFile});
}
