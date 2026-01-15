import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/data/database/database.dart';
import 'package:medilog/providers/providers.dart';

class PrescriptionAddScreen extends ConsumerStatefulWidget {
  final int visitId;
  const PrescriptionAddScreen({required this.visitId, super.key});

  @override
  ConsumerState<PrescriptionAddScreen> createState() => _PrescriptionAddScreenState();
}

class _PrescriptionAddScreenState extends ConsumerState<PrescriptionAddScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _medicineController = TextEditingController();
  final _dosageController = TextEditingController();
  final _durationController = TextEditingController();
  final _notesController = TextEditingController();
  
  // Frequency checkboxes
  bool _morning = true;
  bool _afternoon = false;
  bool _night = true;
  
  int? _selectedMedicineId;
  bool _isSubmitting = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      
      try {
        final frequency = [
          if (_morning) 'Morning',
          if (_afternoon) 'Afternoon',
          if (_night) 'Night'
        ].join(', ');

        if (frequency.isEmpty) {
          throw 'Please select at least one time for frequency';
        }

        final duration = int.tryParse(_durationController.text.trim());
        
        final repo = ref.read(visitRepositoryProvider);
        await repo.addPrescription(
          PrescriptionsCompanion(
            visitId: drift.Value(widget.visitId),
            medicineId: drift.Value(_selectedMedicineId),
            medicineName: drift.Value(_medicineController.text.trim()),
            dosage: drift.Value(_dosageController.text.trim()),
            frequency: drift.Value(frequency),
            durationDays: drift.Value(duration),
            notes: drift.Value(_notesController.text.trim().isEmpty ? null : _notesController.text.trim()),
            startDate: drift.Value(DateTime.now()),
            isActive: const drift.Value(true),
          ),
        );
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('Prescription added'), backgroundColor: AppColors.success),
          );
          Navigator.pop(context, true); // Return success
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
      appBar: AppBar(title: const Text('Add Medicine')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Medicine Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              
              TextFormField(
                controller: _medicineController,
                decoration: const InputDecoration(
                  labelText: 'Medicine Name',
                  hintText: 'Search or enter medicine name',
                  prefixIcon: Icon(Icons.medication),
                ),
                validator: (val) => val == null || val.isEmpty ? 'Please enter medicine name' : null,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dosageController,
                      decoration: const InputDecoration(labelText: 'Dosage', hintText: 'e.g., 500mg, 1 tablet'),
                      validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _durationController,
                      decoration: const InputDecoration(labelText: 'Days', hintText: 'e.g., 5'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              const Text('Frequency', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildCheckbox('Morning', _morning, (v) => setState(() => _morning = v!)),
                  _buildCheckbox('Afternoon', _afternoon, (v) => setState(() => _afternoon = v!)),
                  _buildCheckbox('Night', _night, (v) => setState(() => _night = v!)),
                ],
              ),
              
              const SizedBox(height: 24),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Instructions', hintText: 'e.g., After food'),
              ),
              
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting 
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Add Prescription'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(String label, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Text(label),
        const SizedBox(width: 8),
      ],
    );
  }
}
