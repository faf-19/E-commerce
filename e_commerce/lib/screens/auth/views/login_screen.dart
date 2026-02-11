import 'package:e_commerce/constants.dart';
import 'package:e_commerce/route/route_constants.dart';
import 'package:e_commerce/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _auth = Get.find<AuthService>();
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  
  // Track validation errors for specific feedback
  String _emailError = '';
  String _passwordError = '';

  Future<void> _handleLogin() async {
    // Clear previous errors
    setState(() {
      _emailError = '';
      _passwordError = '';
    });
    
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      
      // Show loading dialog
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
      
      final result = await _auth.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      
      Get.back(); // Close loading dialog
      
      if (result['success'] == true) {
        // Navigate to home screen
        Get.offAllNamed(entryPointScreenRoute);
        Get.snackbar(
          'Success',
          result['message'] ?? 'Logged in successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      } else {
        // Show specific error message
        final errorMessage = result['message'] ?? 'Login failed';
        
        // Determine which field has the error
        if (errorMessage.contains('Email not registered')) {
          setState(() {
            _emailError = errorMessage;
          });
        } else if (errorMessage.contains('Incorrect password')) {
          setState(() {
            _passwordError = errorMessage;
          });
        } else {
          Get.snackbar(
            'Login Failed',
            errorMessage,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: const Duration(seconds: 3),
          );
        }
      }
      
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  // Validate email with specific checks
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    
    // Clear email error if validation passes
    if (_emailError.isNotEmpty) {
      setState(() {
        _emailError = '';
      });
    }
    
    return null;
  }
  
  // Validate password with specific checks
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    
    // Clear password error if validation passes
    if (_passwordError.isNotEmpty) {
      setState(() {
        _passwordError = '';
      });
    }
    
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_dark.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding *1/2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome back!",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  
                  // LoginForm with validation
                  LogInForm(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    emailValidator: _validateEmail,
                    passwordValidator: _validatePassword,
                    emailError: _emailError,
                    passwordError: _passwordError,
                  ),
                  
                  // Show specific error messages if any
                  if (_emailError.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _emailError,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  
                  if (_passwordError.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _passwordError,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(passwordRecoveryScreenRoute);
                      },
                      child: const Text("Forgot password?"),
                    ),
                  ),
                  
                  SizedBox(
                    height: size.height > 700
                        ? size.height * 0.1
                        : defaultPadding,
                  ),
                  
                  ElevatedButton(
                    onPressed: _isLoading ? null : _handleLogin,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : const Text("Log in"),
                  ),
                  
                  const SizedBox(height: defaultPadding),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(signUpScreenRoute);
                        },
                        child: const Text("Sign up"),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}