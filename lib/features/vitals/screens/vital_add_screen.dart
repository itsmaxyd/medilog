import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/vitals/controllers/vital_controller.dart';

class VitalAddScreen extends ConsumerStatefulWidget {
  const VitalAddScreen({super.key});

  @override
  ConsumerState<VitalAddScreen> createState() => _VitalAddScreenState();
}

class _VitalAddScreenState extends ConsumerState<VitalAddScreen> {
  final _formKey = GlobalKey<FormState>();
  
  String _selectedType = 'Blood Pressure';
  final _value1Controller = TextEditingController();
  final _value2Controller = TextEditingController(); // For Systolic/Diastolic
  final _notesController = TextEditingController();
  DateTime _recordedAt = DateTime.now();
  
  bool _isSubmitting = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      
      try {
        double v1 = double.parse(_value1Controller.text.trim());
        double? v2 = _value2Controller.text.isNotEmpty ? double.parse(_value2Controller.text.trim()) : null;
        String unit = '';
        
        switch (_selectedType) {
          case 'Blood Pressure': unit = 'mmHg'; break;
          case 'Heart Rate': unit = 'bpm'; break;
          case 'Weight': unit = 'kg'; break;
          case 'Temperature': unit = '°F'; break;
          case 'Blood Sugar': unit = 'mg/dL'; break;
          case 'SpO2': unit = '%'; break;
        }

        await ref.read(vitalListProvider.notifier).addReading(
          type: _selectedType,
          value1: v1,
          value2: v2,
          unit: unit,
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
          recordedAt: _recordedAt,
        );
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('Reading saved'), backgroundColor: AppColors.success),
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
    bool isBP = _selectedType == 'Blood Pressure';

    return Scaffold(
      appBar: AppBar(title: const Text('Log Vitals')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedType,
                items: ['Blood Pressure', 'Heart Rate', 'Weight', 'Temperature', 'Blood Sugar', 'SpO2']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedType = val!;
                    _value1Controller.clear();
                    _value2Controller.clear();
                  });
                },
                decoration: const InputDecoration(labelText: 'Type'),
              ),
              const SizedBox(height: 24),
              
              if (isBP)
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _value1Controller,
                        decoration: const InputDecoration(labelText: 'Systolic (Upper)', hintText: '120'),
                        keyboardType: TextInputType.number,
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _value2Controller,
                        decoration: const InputDecoration(labelText: 'Diastolic (Lower)', hintText: '80'),
                        keyboardType: TextInputType.number,
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                    ),
                  ],
                )
              else
                TextFormField(
                  controller: _value1Controller,
                  decoration: InputDecoration(
                    labelText: 'Value', 
                    suffixText: _getUnit(_selectedType),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                ),
                
              const SizedBox(height: 16),
              
              InkWell(
                onTap: () async {
                  final now = DateTime.now();
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _recordedAt,
                    firstDate: DateTime(2000),
                    lastDate: now,
                  );
                  if (date != null && context.mounted) {
                     final time = await showTimePicker(
                       context: context,
                       initialTime: TimeOfDay.fromDateTime(_recordedAt),
                     );
                     if (time != null) {
                       setState(() {
                         _recordedAt = DateTime(
                           date.year, date.month, date.day,
                           time.hour, time.minute
                         );
                       });
                     }
                  }
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Recorded At'),
                  child: Text(DateFormat('MMM d, h:mm a').format(_recordedAt)),
                ),
              ),
              
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes (Optional)'),
                maxLines: 2,
              ),
              
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting 
                    ? const CircularProgressIndicator(color: Colors.white) 
                    : const Text('Save Log'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  String _getUnit(String type) {
    switch (type) {
      case 'Heart Rate': return 'bpm';
      case 'Weight': return 'kg';
      case 'Temperature': return '°F';
      case 'Blood Sugar': return 'mg/dL';
      case 'SpO2': return '%';
      default: return '';
    }
  }
}
