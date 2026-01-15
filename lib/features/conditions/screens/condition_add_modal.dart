import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/conditions/controllers/condition_controller.dart';

class ConditionAddModal extends ConsumerStatefulWidget {
  const ConditionAddModal({super.key});

  @override
  ConsumerState<ConditionAddModal> createState() => _ConditionAddModalState();
}

class _ConditionAddModalState extends ConsumerState<ConditionAddModal> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  
  String _selectedType = 'Chronic';
  DateTime? _diagnosedDate;
  bool _isSubmitting = false;

  final List<String> _commonConditions = [
    'Diabetes', 'Hypertension (BP)', 'Asthma', 'PCOS', 
    'Thyroid', 'Arthritis', 'Migraine', 'Allergy', 'Other'
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      
      try {
        await ref.read(conditionListProvider.notifier).addCondition(
          name: _nameController.text.trim(),
          type: _selectedType,
          diagnosedAt: _diagnosedDate,
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        );
        if (mounted) Navigator.pop(context);
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
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16, right: 16, top: 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Add Health Condition', style: Theme.of(context).textTheme.titleLarge),
                IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
              ],
            ),
            const Divider(),
            const SizedBox(height: 16),
            
            // Common Conditions Chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _commonConditions.map((condition) {
                final isSelected = _nameController.text == condition && condition != 'Other';
                return FilterChip(
                  label: Text(condition),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (condition == 'Other') {
                        _nameController.clear();
                      } else {
                        _nameController.text = condition;
                      }
                    });
                  },
                );
              }).toList(),
            ),
            if (_nameController.text.isEmpty || !_commonConditions.contains(_nameController.text) || _nameController.text == 'Other') ...[
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Condition Name', hintText: 'e.g., Gastritis'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
            ],
            
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedType,
                    items: ['Chronic', 'Acute', 'Allergy', 'Other']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) => setState(() => _selectedType = val!),
                    decoration: const InputDecoration(labelText: 'Type'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) setState(() => _diagnosedDate = date);
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(labelText: 'Diagnosed Date'),
                      child: Text(
                        _diagnosedDate == null 
                          ? 'Select Date' 
                          : DateFormat('MMM yyyy').format(_diagnosedDate!),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notes (Optional)', hintText: 'Medication or doctor details'),
              maxLines: 2,
            ),
            
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isSubmitting ? null : _submit,
              child: _isSubmitting ? const CircularProgressIndicator(color: Colors.white) : const Text('Save Condition'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
