import 'package:mn_proj_2/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _auth = AuthService(); // AuthService instance for signing out

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50], // Light background for the home screen
      appBar: AppBar(
        title: const Text('Brew Crew'),
        backgroundColor: Colors.brown[400], // Consistent brown color theme for the app bar
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            
            onPressed: () async {
              await _auth.signOut(); // Calls the signOut method from AuthService
            },
            label: const Text(
              'SIGN OUT',
              style: TextStyle(
                color: Colors.white, // Makes the text white for better contrast
              ),
            ),
            icon: const Icon(
              Icons.person,
              color: Colors.white, // Ensures the icon matches the text color
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, // Sets ripple effect color to white
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to Brew Crew!',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
      ),
    );
  }
}



/*
import 'package:mn_proj_2/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    // return Container(
    //   child: Text('home'),
    // );
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('brew'),
        backgroundColor: const Color.fromARGB(255, 7, 139, 255), //Colors.brown[400]
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            label: Text('SIGN OUT'),
            icon: Icon(Icons.person),
            onPressed: () async{
              await _auth.signOut();//fn name
            },
          )
        ],
      ),
    );
  }
}
*/