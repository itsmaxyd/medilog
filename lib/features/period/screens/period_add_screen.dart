import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/period/controllers/period_controller.dart';

class PeriodAddScreen extends ConsumerStatefulWidget {
  const PeriodAddScreen({super.key});

  @override
  ConsumerState<PeriodAddScreen> createState() => _PeriodAddScreenState();
}

class _PeriodAddScreenState extends ConsumerState<PeriodAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();
  
  DateTime _startDate = DateTime.now();
  DateTime? _endDate;
  String _flow = 'Medium';
  String _mood = 'Normal';
  bool _isPainful = false;
  
  bool _isSubmitting = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      
      try {
        await ref.read(periodListProvider.notifier).addEntry(
          startDate: _startDate,
          endDate: _endDate,
          flow: _flow,
          isPainful: _isPainful,
          mood: _mood,
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        );
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('Log saved'), backgroundColor: AppColors.success),
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
      appBar: AppBar(title: const Text('Log Period')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Dates'),
              const SizedBox(height: 8),
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _startDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) setState(() => _startDate = picked);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Start Date', prefixIcon: Icon(Icons.date_range)),
                  child: Text(DateFormat.yMMMd().format(_startDate)),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _endDate ?? _startDate,
                    firstDate: _startDate,
                    lastDate: DateTime.now().add(const Duration(days: 30)),
                  );
                  if (picked != null) setState(() => _endDate = picked);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'End Date (Optional)', prefixIcon: Icon(Icons.event_busy)),
                  child: Text(_endDate != null ? DateFormat.yMMMd().format(_endDate!) : 'Not ended'),
                ),
              ),
              
              const SizedBox(height: 24),
              _buildSectionTitle('Details'),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: _flow,
                items: ['Spotting', 'Light', 'Medium', 'Heavy']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => _flow = val!),
                decoration: const InputDecoration(labelText: 'Flow Intensity'),
              ),
              
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                  value: _mood,
                  items: ['Normal', 'Happy', 'Sad', 'Irritable', 'Anxious', 'Tired']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => _mood = val!),
                  decoration: const InputDecoration(labelText: 'Mood'),
              ),
              
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Painful / Cramps?'),
                value: _isPainful,
                onChanged: (val) => setState(() => _isPainful = val),
                activeColor: Colors.pink,
              ),
              
              const SizedBox(height: 24),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes', hintText: 'Symptoms, medications...'),
                maxLines: 3,
              ),
              
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade400),
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
  
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.pink.shade700,
      ),
    );
  }
}
