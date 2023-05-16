import 'package:file_picker/file_picker.dart';
import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';

class UploadFilesManager {

  static selectFile(Function(PlatformFile file) comp) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          "pdf",
          "doc",
          "docx",
          "txt",
          "odt",
          "RTF",
          "HTML",
          "JPG"
        ]);

    if (result != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      
      comp(file);
      //print(result.files.single.path);
    } else {
      // User canceled the picker
    }
  }
  
  static uploadFile(PlatformFile file,Function(ResultData object) onCompletion) async {
      await HttpManager.POST_file(
        '/developer/upload_resume',
        file).then((value) {
          print(value);
        });
  } 
}