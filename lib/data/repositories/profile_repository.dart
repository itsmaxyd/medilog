import 'package:drift/drift.dart';
import '../database/database.dart';

class ProfileRepository {
  final AppDatabase _db;

  ProfileRepository(this._db);

  // Get all profiles
  Future<List<Profile>> getAllProfiles() {
    return _db.select(_db.profiles).get();
  }

  // Get profile by ID
  Future<Profile?> getProfileById(int id) {
    return (_db.select(_db.profiles)..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  // Create new profile
  Future<int> createProfile(ProfilesCompanion profile) {
    return _db.into(_db.profiles).insert(profile);
  }

  // Update profile
  Future<bool> updateProfile(Profile profile) {
    return _db.update(_db.profiles).replace(profile);
  }

  // Delete profile
  Future<int> deleteProfile(int id) {
    return (_db.delete(_db.profiles)..where((p) => p.id.equals(id))).go();
  }
}
