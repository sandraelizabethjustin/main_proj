import 'package:flutter/material.dart';
import 'package:mn_proj_2/services/auth.dart';
class AdminHome extends StatefulWidget {
  const AdminHome({super.key});
  
  @override
  State<AdminHome> createState() => _AdminHomeState();
}
class _AdminHomeState extends State<AdminHome> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard',
        style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
                color: Colors.white, // Back arrow color
        ),
        actions: [
          TextButton(
            onPressed: () async {
              // Sign out logic
              await _auth.signOut();
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Manage Users
              },
              child: const Text('ADD ITEMS'),
            ),
            /*ElevatedButton(
              onPressed: () {
                // Other admin functionalities
              },
              child: const Text('View Reports'),
            ),
            */
          ],
        ),
      ),
    );
  }




}