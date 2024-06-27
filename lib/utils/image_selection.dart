


// Future<File?> openInternalStorage({allowedExtensions}) async {
//   final ImagePicker picker = ImagePicker();
//   var result = await picker.pickImage(
//     source: ImageSource.gallery,
//   );
//   if (result != null) {
//     return File(result.path);
//   } else {
//     return null;
//   }
//
//   // FilePickerResult? result = await FilePicker.platform.pickFiles(
//   //   allowMultiple: false,
//   //   type: FileType.media,
//   //   // allowedExtensions:allowedExtensions ?? ['jpg', 'pdf', 'doc'],
//   // );
//   //
//   // if (result != null) {
//   //   File file = File(result.files.single.path!);
//   //   return file;
//   // }
//   // else {
//   //   return null;
//   // }
// }