import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:health_app/config/gpt/extraction/opne_ai_api.dart';
import 'package:health_app/utils/app_print.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

Future<String?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    return result.files.single.path;
  } else {
    return null;
  }
}

Future<String> convertImageToText(String imagePath) async {
  String text = await FlutterTesseractOcr.extractText(imagePath);
  return text;
}

Future<String> convertPdfToText(String pdfPath) async {
  File file = File(pdfPath);
  final PdfDocument document = PdfDocument(inputBytes: file.readAsBytesSync());
  String text = PdfTextExtractor(document).extractText();
  document.dispose();
  return text;
}

Future<String> readTextFile(String filePath) async {
  File file = File(filePath);
  String text = await file.readAsString();
  return text;
}

void handleFileUpload(String filePath) async {
  String fileType = filePath.split('.').last.toLowerCase();
  String extractedText;

  if (fileType == 'jpg' || fileType == 'png' || fileType == 'jpeg') {
    extractedText = await convertImageToText(filePath);
  } else if (fileType == 'pdf') {
    extractedText = await convertPdfToText(filePath);
  } else if (fileType == 'txt') {
    extractedText = await readTextFile(filePath);
  } else {
    appDebugPrint('Unsupported file type');
    return;
  }

  try {
    OpenAIApi openAIApi = OpenAIApi(
        apiKey: '', 
        endpoint: '');
    final response = await openAIApi.generateResponse(extractedText);
    appDebugPrint('GPT Response: $response');
  } catch (e) {
    appDebugPrint('Error: $e');
  }
}
