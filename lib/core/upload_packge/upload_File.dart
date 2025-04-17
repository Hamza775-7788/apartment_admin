import 'dart:convert';
import 'dart:io';
import 'package:apartment_admin/core/error/exceptions.dart';
import "package:http/http.dart" as http;
import "package:path/path.dart" as path;

abstract class UploaidFiles {
  Future<String> uploadFile(
      {required File file,
      required String foleder,
      Map? data,
      required String url});
}

class UploaidFilesImpl implements UploaidFiles {
  UploaidFilesImpl();
  @override
  Future<String> uploadFile(
      {required File file,
      required String foleder,
      Map? data,
      required String url}) async {
    final response = await http.MultipartRequest("POST", Uri.parse(url));
    var fileLigth = await file.length();
    var strem = http.ByteStream(file.openRead());
    var fileName = path.basename(file.path);
    var multiPartFile = http.MultipartFile(
      "file",
      strem,
      fileLigth,
      filename: fileName,
    );
    response.files.add(multiPartFile);
    response.fields["folderName"] = foleder;
    data?.forEach((key, value) {
      response.fields[key] = value;
    });
    var myrequest = await response.send();
    var result = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      final jsonData = jsonDecode(result.body);
      if (jsonData['status']) {
        return Future.value(jsonData['url']);
      } else {
        if (jsonData['error'] == "size") {
          throw ImageToLagargeException();
        } else if (jsonData['error'] == "type") {
          throw InvalidTypeImageException();
        } else {
          throw UnexpectedErrorException();
        }
      }
    } else {
      throw ServerException();
    }
  }
}
