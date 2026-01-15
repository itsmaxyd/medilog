import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class OCRService {
  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  final _picker = ImagePicker();

  Future<String?> scanImage(XFile imageFile) async {
    try {
      final inputImage = InputImage.fromFilePath(imageFile.path);
      final recognizedText = await _textRecognizer.processImage(inputImage);
      return recognizedText.text;
    } catch (e) {
      print('OCR Error: $e');
      return null;
    }
  }

  Future<XFile?> pickImage({required ImageSource source}) async {
    try {
      return await _picker.pickImage(source: source);
    } catch (e) {
      print('Image Picker Error: $e');
      return null;
    }
  }

  void dispose() {
    _textRecognizer.close();
  }
}
