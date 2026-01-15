import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/visits/controllers/visit_controller.dart';

class VisitAddScreen extends ConsumerStatefulWidget {
  const VisitAddScreen({super.key});

  @override
  ConsumerState<VisitAddScreen> createState() => _VisitAddScreenState();
}

class _VisitAddScreenState extends ConsumerState<VisitAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _doctorNameController = TextEditingController();
  final _hospitalController = TextEditingController();
  final _contactController = TextEditingController();
  final _notesController = TextEditingController();
  
  DateTime _visitDate = DateTime.now();
  DateTime? _followUpDate;
  
  bool _isSubmitting = false;

  @override
  void dispose() {
    _doctorNameController.dispose();
    _hospitalController.dispose();
    _contactController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      
      try {
        await ref.read(visitListProvider.notifier).addVisit(
          doctorName: _doctorNameController.text.trim(),
          hospital: _hospitalController.text.trim().isEmpty ? null : _hospitalController.text.trim(),
          doctorContact: _contactController.text.trim().isEmpty ? null : _contactController.text.trim(),
          visitDate: _visitDate,
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
          followUpDate: _followUpDate,
        );
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('Visit recorded'), backgroundColor: AppColors.success),
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

  Future<void> _pickDate(bool isFollowUp) async {
    final now = DateTime.now();
    final initialDate = isFollowUp 
        ? (_followUpDate ?? now.add(const Duration(days: 7))) 
        : _visitDate;
        
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: isFollowUp ? DateTime(2100) : now,
    );

    if (pickedDate != null) {
      if (!isFollowUp) {
        // Also pick time for visit date
        if (context.mounted) {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(_visitDate),
          );
          if (time != null) {
            setState(() {
              _visitDate = DateTime(
                pickedDate.year, pickedDate.month, pickedDate.day,
                time.hour, time.minute,
              );
            });
          }
        }
      } else {
         setState(() => _followUpDate = pickedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Doctor Visit')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle(context, 'Date & Time'),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => _pickDate(false),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month, color: AppColors.primary),
                    labelText: 'Visit Date',
                  ),
                  child: Text(
                    DateFormat('EEE, MMM d, yyyy • h:mm a').format(_visitDate),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              _buildSectionTitle(context, 'Doctor Details'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _doctorNameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  labelText: 'Doctor Name',
                  hintText: 'e.g. Dr. A. Smith',
                ),
                textCapitalization: TextCapitalization.words,
                validator: (val) => val == null || val.isEmpty ? 'Please enter doctor/clinic name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hospitalController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.local_hospital_outlined),
                  labelText: 'Hospital / Clinic (Optional)',
                ),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contactController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone_outlined),
                  labelText: 'Contact Number (Optional)',
                ),
                keyboardType: TextInputType.phone,
              ),
              
              const SizedBox(height: 24),
              _buildSectionTitle(context, 'Follow-up'),
              const SizedBox(height: 8),
              Row(
                 children: [
                   Expanded(
                     child: InkWell(
                        onTap: () => _pickDate(true),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.event_repeat),
                            labelText: 'Follow-up Date',
                          ),
                          child: Text(
                            _followUpDate == null ? 'None' : DateFormat('EEE, MMM d, yyyy').format(_followUpDate!),
                            style: TextStyle(
                              fontSize: 16,
                              color: _followUpDate == null ? AppColors.textHint : AppColors.textPrimary
                            ),
                          ),
                        ),
                      ),
                   ),
                   if (_followUpDate != null)
                     IconButton(
                       icon: const Icon(Icons.clear),
                       onPressed: () => setState(() => _followUpDate = null),
                     ),
                 ],
              ),
              
              const SizedBox(height: 24),
              _buildSectionTitle(context, 'Notes'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'Consultation Notes',
                  alignLabelWithHint: true,
                ),
                maxLines: 4,
              ),
              
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting 
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Save Record'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
    );
  }
}
