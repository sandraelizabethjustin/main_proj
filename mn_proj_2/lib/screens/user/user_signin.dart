import 'package:flutter/material.dart';
//import 'package:mn_proj_2/screens/home/home.dart';
import 'package:mn_proj_2/services/auth.dart';
import 'package:mn_proj_2/shared/loading.dart';
import 'package:mn_proj_2/shared/constant.dart';

class UserSignIn extends StatefulWidget {
  final Function toggleView;
  const UserSignIn({super.key,required this.toggleView});

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text('User Login'),
              backgroundColor: Colors.brown,
              elevation: 0.0,
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
                    'REGISTER',
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
                    //     maxWidth: 600, // Example constraint for width
                    //     maxHeight: 800, // Add a reasonable height constraint
                    //   ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'User Login',
                            style:
                                TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            //decoration: const InputDecoration(labelText: 'Email'),
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
                            validator: (value) =>
                                value!.isEmpty ? "Enter an email" : null,
                            onChanged: (value) {
                              setState(() => email = value);
                            },
                          ),
                          TextFormField(
                            //decoration: const InputDecoration(labelText: 'Password'),
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
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth
                                    .signInWithEmailAndPassword(email, password);
                                if (result == null) {
                                  setState(
                                    () {
                                      error =
                                          'COULD NOT SIGN IN With THOSE CREDENTIALS';
                                      loading = false;
                                    },
                                  );
                                }//else automatically goes to home page meaning correctly signed in
                              }
                            },
                            child: const Text('USER Login'),
                          ),
                          /*TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/user_signup');
                            },
                            child: const Text('Don’t have an account? Sign up'),
                          ),*/
                        ],
                      ),
                    ),
                ),
              ),
            ),
            
          );
  }
}
