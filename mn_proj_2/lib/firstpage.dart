import 'package:flutter/material.dart';
import 'package:mn_proj_2/secondpage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
  //_FoodSelectorState createState() => _FoodSelectorState();
}

class _FirstPageState extends State<FirstPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Selector'),
      ),
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
