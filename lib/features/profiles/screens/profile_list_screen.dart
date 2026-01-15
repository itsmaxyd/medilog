import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/profiles/controllers/profile_controller.dart';
import 'profile_create_screen.dart';
import 'package:medilog/features/home/home_screen.dart';

class ProfileListScreen extends ConsumerWidget {
  const ProfileListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profilesAsync = ref.watch(profileListProvider);
    final selectedId = ref.watch(selectedProfileIdProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Who is using MediLog?')),
      body: profilesAsync.when(
        data: (profiles) {
          if (profiles.isEmpty) {
            return _buildEmptyState(context);
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: profiles.length + 1, // +1 for "Add New" button card
            itemBuilder: (context, index) {
              if (index == profiles.length) {
                return _buildAddCard(context);
              }
              final profile = profiles[index];
              return _buildProfileCard(context, ref, profile, selectedId == profile.id);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.family_restroom, size: 80, color: AppColors.primaryLight),
          const SizedBox(height: 24),
          Text(
            'Welcome!',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 8),
          const Text(
            'Create a profile to get started',
            style: TextStyle(fontSize: 18, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (_) => const ProfileCreateScreen()),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Create Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCard(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.textHint, width: 1, style: BorderStyle.solid),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (_) => const ProfileCreateScreen()),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: const [
              Icon(Icons.add_circle_outline, size: 40, color: AppColors.textSecondary),
              SizedBox(width: 16),
              Text(
                'Add Another Member',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, WidgetRef ref, dynamic profile, bool isSelected) {
    return Card(
      elevation: isSelected ? 8 : 2,
      color: isSelected ? AppColors.primary : Colors.white,
      child: InkWell(
        onTap: () {
          ref.read(selectedProfileIdProvider.notifier).state = profile.id;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : AppColors.background,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    profile.emoji,
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${profile.age} years • ${profile.sex}',
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.white70 : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios, 
                color: isSelected ? Colors.white70 : AppColors.textHint,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
