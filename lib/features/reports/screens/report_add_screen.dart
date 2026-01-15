import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/reports/controllers/report_controller.dart';
import 'package:medilog/features/ocr/screens/scan_screen.dart';

class ReportAddScreen extends ConsumerStatefulWidget {
  const ReportAddScreen({super.key});

  @override
  ConsumerState<ReportAddScreen> createState() => _ReportAddScreenState();
}

class _ReportAddScreenState extends ConsumerState<ReportAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _testNameController = TextEditingController();
  final _resultController = TextEditingController();
  final _notesController = TextEditingController();
  
  DateTime _date = DateTime.now();
  String? _extractedText;
  String? _imagePath; // To store image path if we save it (not implemented yet, just OCR text for now)
  
  bool _isSubmitting = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      
      try {
        await ref.read(reportListProvider.notifier).addReport(
          testName: _testNameController.text.trim(),
          date: _date,
          result: _resultController.text.trim().isEmpty ? null : _resultController.text.trim(),
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
          extractedText: _extractedText,
          filePath: _imagePath,
        );
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('Report saved'), backgroundColor: AppColors.success),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e'), backgroundColor: AppColors.error),
          );
        }
      } finally {
        if (mounted) setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Test Report')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Scan Button
              Container(
                 width: double.infinity,
                 margin: const EdgeInsets.only(bottom: 24),
                 child: OutlinedButton.icon(
                   onPressed: () async {
                     final text = await Navigator.push(
                       context, 
                       MaterialPageRoute(builder: (_) => const ScanScreen())
                     );
                     
                     if (text != null) {
                       setState(() {
                         _extractedText = text;
                         if (_notesController.text.isEmpty) {
                           _notesController.text = "Scanned Data:\n$text";
                         } else {
                           _notesController.text += "\n\nScanned Data:\n$text";
                         }
                       });
                     }
                   },
                   icon: const Icon(Icons.document_scanner),
                   label: const Text('Scan Document (OCR)'),
                   style: OutlinedButton.styleFrom(
                     padding: const EdgeInsets.all(16),
                     side: const BorderSide(color: AppColors.primary, width: 1.5),
                   ),
                 ),
              ),

              TextFormField(
                controller: _testNameController,
                decoration: const InputDecoration(labelText: 'Test Name', hintText: 'e.g. Blood Test, X-Ray'),
                textCapitalization: TextCapitalization.words,
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) setState(() => _date = picked);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Date'),
                  child: Text(DateFormat.yMMMd().format(_date)),
                ),
              ),
              
              const SizedBox(height: 16),
              TextFormField(
                controller: _resultController,
                decoration: const InputDecoration(labelText: 'Result (Optional)', hintText: 'e.g. Normal, High'),
              ),
              
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes / Details'),
                maxLines: 4,
              ),
              
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting 
                    ? const CircularProgressIndicator(color: Colors.white) 
                    : const Text('Save Report'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
