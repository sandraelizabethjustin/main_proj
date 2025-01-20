import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/*void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send Location to Server',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const LocationSender(),
    );
  }
}*/

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
  //LocationSenderState createState() => LocationSenderState();
}

class _SecondPageState extends State<SecondPage> {
  String _locationMessage = "No location sent yet.";

  // Function to send location to the Python server
  Future<void> sendLocationToServer(double lat, double long) async {
    final url = Uri.parse('http://192.168.1.7:5000/update_location');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'lat': lat, 'long': long}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _locationMessage =
            "Updated TSP Path: ${data['shortest_path']}\nUpdated TSP Distance: ${data['min_distance']}";
      });
    } else {
      setState(() {
        _locationMessage =
            "Failed to update location. Status code: ${response.statusCode}";
      });
    }
  }

  // Function to get the current location and send it to the server
  Future<void> _getCurrentLocationAndSend() async {
    bool serviceEnabled;

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw Exception('Location permission is denied.');
    }
    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = 'Location services are disabled.';
      });
      return;
    }

    // Request location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = 'Location permissions are denied.';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage =
            'Location permissions are permanently denied. Please enable them in settings.';
      });
      return;
    }

    // Get the current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    // Send the location to the server
    await sendLocationToServer(lat, long);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Location to Server"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getCurrentLocationAndSend,
              child: const Text("Send Current Location"),
            ),
            const SizedBox(height: 20),
            Text(
              _locationMessage,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}