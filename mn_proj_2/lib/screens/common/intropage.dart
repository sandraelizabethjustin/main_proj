import 'package:flutter/material.dart';
import 'package:mn_proj_2/screens/common/wrapper.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to WingWay",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String isAdmin = 'admin';

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Wrapper(isAdmin: isAdmin),
                    ),
                  ); // Navigate to Admin Login
              },
              child: const Text('Admin Login'),
            ),
            ElevatedButton(
              onPressed: () {
                String isAdmin = 'user';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Wrapper(isAdmin: isAdmin),
                    ),
                ); 
              },
              child: const Text('User Login'),
            ),
          ],
        ),
      ),
    );
  }
}
