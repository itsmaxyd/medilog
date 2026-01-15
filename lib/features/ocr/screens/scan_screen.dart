import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/providers/providers.dart';

class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});

  @override
  ConsumerState<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  File? _imageFile;
  String? _extractedText;
  bool _isScanning = false;

  Future<void> _pickImage(ImageSource source) async {
    final ocrService = ref.read(ocrServiceProvider);
    
    // Pick image
    final pickedFile = await ocrService.pickImage(source: source);
    if (pickedFile == null) return;

    setState(() {
      _imageFile = File(pickedFile.path);
      _extractedText = null;
      _isScanning = true;
    });

    // Scan Text
    final text = await ocrService.scanImage(pickedFile);
    
    if (mounted) {
      setState(() {
        _extractedText = text;
        _isScanning = false;
      });
    }
  }

  void _copyToClipboard() {
    if (_extractedText != null) {
      // For now just pop back with text
      Navigator.pop(context, _extractedText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Document')),
      body: Column(
        children: [
          // Image Preview Area
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              color: Colors.black12,
              child: _imageFile == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.image_search, size: 64, color: AppColors.textHint),
                        SizedBox(height: 16),
                        Text('Take a photo or choose from gallery', style: TextStyle(color: AppColors.textHint)),
                      ],
                    )
                  : Image.file(_imageFile!, fit: BoxFit.contain),
            ),
          ),
          
          // Extracted Text Area
           if (_extractedText != null)
             Expanded(
               flex: 3,
               child: Container(
                 width: double.infinity,
                 padding: const EdgeInsets.all(16),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: const Offset(0, -2))],
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         const Text('Extracted Text', style: TextStyle(fontWeight: FontWeight.bold)),
                         TextButton.icon(
                           onPressed: _copyToClipboard,
                           icon: const Icon(Icons.check),
                           label: const Text('Use Text'),
                         ),
                       ],
                     ),
                     const Divider(),
                     Expanded(
                       child: SingleChildScrollView(
                         child: SelectableText(_extractedText!),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
             
          // Action Buttons
          if (!_isScanning)
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                   Expanded(
                     child: ElevatedButton.icon(
                       onPressed: () => _pickImage(ImageSource.camera),
                       icon: const Icon(Icons.camera_alt),
                       label: const Text('Camera'),
                     ),
                   ),
                   const SizedBox(width: 16),
                   Expanded(
                     child: OutlinedButton.icon(
                       onPressed: () => _pickImage(ImageSource.gallery),
                       icon: const Icon(Icons.photo_library),
                       label: const Text('Gallery'),
                     ),
                   ),
                ],
              ),
            )
          else 
            const Padding(
              padding: EdgeInsets.all(32),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
