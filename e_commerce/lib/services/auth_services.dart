// lib/services/auth_service.dart
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  final GetStorage _box = GetStorage();
  final String _userKey = 'current_user';
  final String _usersKey = 'registered_users';
  
  Future<AuthService> init() async {
    return this;
  }
  
  bool get isLoggedIn => _box.hasData(_userKey);
  Map<String, dynamic>? get currentUser => _box.read(_userKey);
  
  // Login with detailed error handling
  Future<Map<String, dynamic>> login(String email, String password) async {
    final List<dynamic> users = _box.read(_usersKey) ?? [];
    
    // Check if email exists
    final userExists = users.any((user) => user['email'] == email);
    
    if (!userExists) {
      return {
        'success': false,
        'message': 'Email not registered. Please sign up first.',
      };
    }
    
    // Find user with matching email and password
    final user = users.firstWhere(
      (user) => user['email'] == email && user['password'] == password,
      orElse: () => null,
    );
    
    if (user == null) {
      return {
        'success': false,
        'message': 'Incorrect password. Please try again.',
      };
    }
    
    // Login successful
    await _box.write(_userKey, user);
    return {
      'success': true,
      'message': 'Login successful',
      'user': user,
    };
  }
  
  // Register new user
  Future<Map<String, dynamic>> register(Map<String, dynamic> userData) async {
    try {
      final List<dynamic> users = _box.read(_usersKey) ?? [];
      
      // Check if email already exists
      final emailExists = users.any((user) => user['email'] == userData['email']);
      if (emailExists) {
        return {
          'success': false,
          'message': 'Email already registered. Please use a different email.',
        };
      }
      
      // Add new user
      users.add(userData);
      await _box.write(_usersKey, users);
      
      // Auto login after registration
      await _box.write(_userKey, userData);
      
      return {
        'success': true,
        'message': 'Registration successful',
        'user': userData,
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Registration failed. Please try again.',
      };
    }
  }
  
  // Logout user
  Future<void> logout() async {
    await _box.remove(_userKey);
  }
  
  // Check if email exists
  bool emailExists(String email) {
    final List<dynamic> users = _box.read(_usersKey) ?? [];
    return users.any((user) => user['email'] == email);
  }
  
  // Get user by email (for more specific checks)
  Map<String, dynamic>? getUserByEmail(String email) {
    final List<dynamic> users = _box.read(_usersKey) ?? [];
    try {
      return users.firstWhere(
        (user) => user['email'] == email,
        orElse: () => null,
      );
    } catch (e) {
      return null;
    }
  }
}