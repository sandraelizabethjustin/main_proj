import 'package:mn_proj_2/models/myuser.dart';
import 'package:mn_proj_2/screens/authenticate/authenticate.dart';
import 'package:mn_proj_2/screens/home/home.dart';
import 'package:mn_proj_2/screens/home/adminhome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  final String isAdmin;
  const Wrapper({super.key,required this.isAdmin});
  
  @override
  Widget build(BuildContext context) {
    final newuser=Provider.of<MyUser?>(context);
    //print(newuser);
    //return either authenticate or home
    //return Authenticate();
    if(newuser==null){
      return Authenticate(isAdmin:isAdmin);//go to login or signup page
    }
    else{
      if (isAdmin == 'admin') {
        return AdminHome(); // Admin's home page
      } else {
        return Home(); // Regular user's home page
      }
      //return Home(); //if only user page
       // Check if user is admin or regular user
      /*if (newuser.isAdmin) {
        return AdminHome(); // Admin's home page
      } else {
        return Home(); // Regular user's home page
      }*/
    }
  }
}