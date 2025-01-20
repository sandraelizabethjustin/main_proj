import 'package:mn_proj_2/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:mn_proj_2/services/auth.dart';
import 'package:mn_proj_2/shared/constant.dart';

class UserSignUp extends StatefulWidget {
  final Function toggleView;
  const UserSignUp({super.key,required this.toggleView});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading=false;
  String email = '';
  String password = '';
  String error = '';
  String isAdmin='user';
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        elevation: 0.0,
        title: Text('Sign up to brew crew...'), //register
         
        actions: [
          TextButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              widget.toggleView();
            },
            label: Text(
              'SIGNIN',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, // Optional: Make it bold
              ),
            ),
            style: TextButton.styleFrom(
              foregroundColor:
                  Colors.black, // Optional: Icon color or ripple effect color
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
          
            //p10
            // constraints: const BoxConstraints(
            //   maxWidth: 600, // Example constraint for width
            //   maxHeight: 800, // Add a reasonable height constraint
            // ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'User SIGNUP',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration:textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (value) => value!.isEmpty ? "Enter an email" : null,
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    obscureText: true,
                    validator: (val) =>
                        val!.length < 6 ? "Enter a password 6+ chars long" : null,
                    onChanged: (value) {
                      setState(() => password = value);
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    //color: //for sign in ano
                    //color:Colors.pink[400],
                    onPressed: () async {//button t register
                      // print(email);
                      // print(password);
                      if (_formKey.currentState!.validate()) {
                        //valid nd can send to firebase
                        // print(email);
                        // print(password);
                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmailAndPassword(
                            email, password,isAdmin);
                        if (result == null) {
                          
                          //setState(() => error = 'please supply a valid email');
                          setState(() {
                              error = 'please supply a valid email';
                              loading=false;
                            }
                          );
                        } //else automatically goes to home page meaning correctly registered
                        
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.pink[400]),
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}