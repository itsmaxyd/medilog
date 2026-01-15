import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/core/constants/emoji_avatars.dart';
import 'package:medilog/features/profiles/controllers/profile_controller.dart';

class ProfileCreateScreen extends ConsumerStatefulWidget {
  const ProfileCreateScreen({super.key});

  @override
  ConsumerState<ProfileCreateScreen> createState() => _ProfileCreateScreenState();
}

class _ProfileCreateScreenState extends ConsumerState<ProfileCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  
  String _selectedSex = 'Male';
  String _selectedEmoji = EmojiAvatars.defaultAvatar;
  
  bool _isSubmitting = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });
      
      try {
        await ref.read(profileListProvider.notifier).addProfile(
          name: _nameController.text.trim(),
          age: int.parse(_ageController.text.trim()),
          sex: _selectedSex,
          emoji: _selectedEmoji,
        );
        
        if (mounted) {
          Navigator.pop(context, true); // Return success
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e'), backgroundColor: AppColors.error),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Family Member')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar Selection
              Center(
                child: GestureDetector(
                  onTap: _showAvatarPicker,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 3),
                    ),
                    child: Center(
                      child: Text(
                        _selectedEmoji,
                        style: const TextStyle(fontSize: 64),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(child: Text('Tap to change', style: TextStyle(color: AppColors.textHint))),
              const SizedBox(height: 32),
              
              // Name
              Text('Name', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Enter name'),
                textCapitalization: TextCapitalization.words,
                validator: (value) => value == null || value.isEmpty ? 'Please enter a name' : null,
              ),
              const SizedBox(height: 24),
              
              // Age
              Text('Age', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(hintText: 'Enter age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter age';
                  if (int.tryParse(value) == null) return 'Invalid age';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              
              // Sex
              Text('Sex', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildSexOption('Male', AppColors.male),
                  const SizedBox(width: 16),
                  _buildSexOption('Female', AppColors.female),
                  const SizedBox(width: 16),
                  _buildSexOption('Other', AppColors.other),
                ],
              ),
              
              const SizedBox(height: 48),
              
              // Submit
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting 
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Save Profile'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSexOption(String label, Color color) {
    final isSelected = _selectedSex == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedSex = label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.1) : Colors.white,
            border: Border.all(
              color: isSelected ? color : AppColors.textHint,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? color : AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 300,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: EmojiAvatars.list.length,
            itemBuilder: (context, index) {
              final emoji = EmojiAvatars.list[index];
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedEmoji = emoji);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: Text(emoji, style: const TextStyle(fontSize: 32))),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
