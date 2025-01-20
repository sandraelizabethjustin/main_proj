import 'package:flutter/material.dart';
import 'package:mn_proj_2/shared/loading.dart';
import 'package:mn_proj_2/services/auth.dart';
import 'package:mn_proj_2/shared/constant.dart';

class AdminSignUp extends StatefulWidget {
  final Function toggleView;
  const AdminSignUp({super.key, required this.toggleView});

  @override
  State<AdminSignUp> createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';
  String isAdmin='admin';//for pass this to auth.dart
  @override
  Widget build(BuildContext context) {
    return loading
        ?const Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[500],
              elevation: 0.0,
              title: Text('ADMIN'),
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
                    'Signin',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // Optional: Make it bold
                    ),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors
                        .black, // Optional: Icon color or ripple effect color
                  ),
                ),
              ],
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(20.0),
                  // constraints: const BoxConstraints(
                  //   maxWidth: 600, // Example constraint for width
                  //   maxHeight: 800, // Add a reasonable height constraint
                  // ),
                  //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'ADMIN SIGNUP',
                          style:
                              TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Email'),
                          validator: (value) =>
                              value!.isEmpty ? "Enter an email" : null,
                          onChanged: (value) {
                            setState(() => email = value);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Password'),
                          obscureText: true,
                          validator: (val) => val!.length < 6
                              ? "Enter a password 6+ chars long"
                              : null,
                          onChanged: (value) {
                            setState(() => password = value);
                          },
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              //valid nd can send to firebase
                              // print(email);
                              // print(password);
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password, isAdmin);
                              if (result == null) {
                                //setState(() => error = 'please supply a valid email');
                                setState(() {
                                  error = 'please supply a valid email';
                                  loading = false;
                                });
                              } //else automatically goes to home page meaning correctly registered
                              
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.pink[400]),
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
