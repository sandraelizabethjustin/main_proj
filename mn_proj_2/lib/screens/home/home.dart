import 'package:mn_proj_2/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:mn_proj_2/screens/home/secondpage.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
  //_FoodSelectorState createState() => _FoodSelectorState();
}


class _HomeState extends State<Home> {
  final List<String> _foodItems = [
    'Pizza',
    'Burger',
    'Chapati',
    'Potato',
    'abc',
    'def'
  ];
  String? _selectedFood;
  String locationMessage = '';
  final AuthService _auth = AuthService(); // AuthService instance for signing out

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50], // Light background for the home screen
      appBar: AppBar(
        title: const Text('select',
        style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
                color: Colors.white, // Back arrow color
        ), // Consistent brown color theme for the app bar
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
      // body: const Center(
      //   child: Text(
      //     'Welcome to Brew Crew!',
      //     style: TextStyle(
      //       fontSize: 18.0,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.brown,
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedFood,
              hint: const Text('Select a food item'),
              items: _foodItems.map((food) {
                return DropdownMenuItem<String>(
                  value: food,
                  child: Text(food),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedFood = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return SecondPage();
                    },
                  ),
                );
              },
              child: const Text('PROCEED'),
            ),
            /*const SizedBox(height: 20),
            Text(
              locationMessage,
              textAlign: TextAlign.center,
            ),*/
          ],
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