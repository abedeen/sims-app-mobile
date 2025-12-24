import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ===============================
  // 1️⃣ UI + validation function
  // ===============================
  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showError('Email and password are required');
      return;
    }

    final bool isValid = await _loginAtServer(email, password);

    if (isValid) {
      Navigator.of(context).pushReplacementNamed('/dashboard');
    } else {
      _showError('Invalid email or password');
    }
  }

  // ===============================
  // 2️⃣ REST POST (backend login)
  // ===============================
  Future<bool> _loginAtServer(String email, String password) async {
    final client = http.Client();

    try {
      final request = http.Request(
        'POST',
        Uri.parse('https://simsapp.co.uk/login'),
      );

      request.headers['Content-Type'] = 'application/x-www-form-urlencoded';

      request.bodyFields = {
        'email': email,
        'password': password,
      };

      // 🔴 IMPORTANT: do NOT auto-follow redirect
      request.followRedirects = false;

      final response = await client.send(request);

      if (response.statusCode == 302) {
        final location = response.headers['location'];
        final cookie = response.headers['set-cookie'];

        /*
          SUCCESS:
          - Location: http://simsapp.co.uk/
          - Set-Cookie: JSESSIONID=xxxx
        */
        if (location == 'http://simsapp.co.uk/' &&
            cookie != null &&
            cookie.contains('JSESSIONID')) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(
            'JSESSIONID',
            cookie.split(';').first,
          );
          return true;
        }
      }

      return false;
    } catch (e) {
      return false;
    } finally {
      client.close();
    }
  }

  // ===============================
  // 3️⃣ Error UI helper
  // ===============================
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // ===============================
  // UI
  // ===============================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
