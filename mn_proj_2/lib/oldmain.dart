import 'package:flutter/material.dart';
import 'package:mn_proj_2/firstpage.dart';
//import 'package:mn_proj_2/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        //primarySwatch: Colors.green,
      ),
      //home: HomePage(),
      home: FirstPage(),
    );
  }
}
     