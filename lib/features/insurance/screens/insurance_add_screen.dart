import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/insurance/controllers/insurance_controller.dart';

class InsuranceAddScreen extends ConsumerStatefulWidget {
  const InsuranceAddScreen({super.key});

  @override
  ConsumerState<InsuranceAddScreen> createState() => _InsuranceAddScreenState();
}

class _InsuranceAddScreenState extends ConsumerState<InsuranceAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _providerController = TextEditingController();
  final _policyController = TextEditingController();
  final _contactController = TextEditingController();
  final _notesController = TextEditingController();
  
  DateTime _validUntil = DateTime.now().add(const Duration(days: 365));
  bool _isSubmitting = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      
      try {
        await ref.read(insuranceListProvider.notifier).addInsurance(
          providerName: _providerController.text.trim(),
          policyNumber: _policyController.text.trim(),
          validUntil: _validUntil,
          contactNumber: _contactController.text.trim().isEmpty ? null : _contactController.text.trim(),
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        );
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('Insurance added'), backgroundColor: AppColors.success),
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
      appBar: AppBar(title: const Text('Add Insurance')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _providerController,
                decoration: const InputDecoration(labelText: 'Provider Name', hintText: 'e.g. Star Health'),
                textCapitalization: TextCapitalization.words,
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _policyController,
                decoration: const InputDecoration(labelText: 'Policy Number'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _validUntil,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) setState(() => _validUntil = picked);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Valid Until'),
                  child: Text(DateFormat.yMMMd().format(_validUntil)),
                ),
              ),
              
              const SizedBox(height: 16),
              TextFormField(
                controller: _contactController,
                decoration: const InputDecoration(labelText: 'Support Contact (Optional)'),
                keyboardType: TextInputType.phone,
              ),
              
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes', hintText: 'Coverage details...'),
                maxLines: 4,
              ),
              
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting 
                    ? const CircularProgressIndicator(color: Colors.white) 
                    : const Text('Save Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
