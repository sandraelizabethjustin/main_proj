import 'package:flutter/material.dart';
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 150), // App Logo
            const SizedBox(height: 30),
            const Text(
              "Welcome to MyApp",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/admin_login'); // Navigate to Admin Login
              },
              child: const Text('Admin Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/user_login'); // Navigate to User Login
              },
              child: const Text('User Login'),
            ),
          ],
        ),
      ),
    );
  }
}
