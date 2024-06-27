//
//
//
// import 'package:permission_handler/permission_handler.dart';
//
// import 'app_print.dart';
//
// openInternalStorage() async{
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     allowMultiple: false,
//     type: FileType.custom,
//     allowedExtensions: ['jpg', 'pdf', 'doc'],
//   );
//   if (result != null) {
//     PlatformFile file = result.files.first;
//
//     appDebugPrint(file.name);
//     appDebugPrint(file.bytes);
//     appDebugPrint(file.size);
//     appDebugPrint(file.extension);
//     appDebugPrint(file.path);
//   } else {
//
//   }
// }
//
// Future<bool> requestPermissionAndLoadPdf() async {
//   var result = false;
//   var status = await Permission.storage.status;
//   if (status.isGranted) {
//     result = true;
//   } else {
//     status = await Permission.storage.request();
//     if (status.isGranted) {
//       result = true;
//     } else {
//       result = false;
//     }
//   }
//   return result;
// }

import 'package:image_picker/image_picker.dart';

import 'app_print.dart';

Future<XFile?> getImage() async {
  appDebugPrint('getImage');
  // final ImagePicker _picker = ;
  try {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    return pickedFile;
  } catch (e) {
    appDebugPrint(e.toString());
    return null;
  }
}
