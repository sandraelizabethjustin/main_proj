/*import 'package:flutter/material.dart';
import 'package:mn_proj_2/services/auth.dart';
import 'package:mn_proj_2/shared/loading.dart';
import 'package:mn_proj_2/shared/constant.dart';

class AdminSignIn extends StatefulWidget {
  final Function toggleView;
  const AdminSignIn({super.key, required this.toggleView});

  @override
  State<AdminSignIn> createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                'Admin Login',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.deepPurple,
              elevation: 4.0,
              actions: [
                TextButton.icon(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    widget.toggleView();
                  },
                  label: const Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 255, 77, 77),
                    Colors.indigo,
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome Back, Admin!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                            hintText: 'Enter your email',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 81, 164, 87),
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.deepPurple, width: 2.0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? "Enter an email" : null,
                          onChanged: (value) {
                            setState(() => email = value);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                            hintText: 'Enter your password',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.deepPurple, width: 2.0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          obscureText: true,
                          validator: (val) => val!.length < 6
                              ? "Enter a password 6+ chars long"
                              : null,
                          onChanged: (value) {
                            setState(() => password = value);
                          },
                        ),
                        const SizedBox(height: 30),
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
                                        'Could not sign in with those credentials';
                                    loading = false;
                                  },
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shadowColor: const Color.fromARGB(255, 58, 183, 83),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 15.0),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          error,
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            // Handle forgot password
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
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
*/




import 'package:flutter/material.dart';
import 'package:mn_proj_2/services/auth.dart';
import 'package:mn_proj_2/shared/loading.dart';
import 'package:mn_proj_2/shared/constant.dart';

class AdminSignIn extends StatefulWidget {
  final Function toggleView;
  const AdminSignIn({super.key, required this.toggleView});

  @override
  State<AdminSignIn> createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Admin Login',
              style: TextStyle(color: Colors.white),
              ),
              
              backgroundColor: Colors.black,
              iconTheme: const IconThemeData(
                color: Colors.white, // Back arrow color
              ),
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
            child:SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  // constraints: const BoxConstraints(
                  //   maxWidth: 600, // Example constraint for width
                  //   maxHeight: 800, // Add a reasonable height constraint
                  // ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Admin Login',
                          style:TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
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
                                    'INVALID CREDENTIALS';
                                        //'COULD NOT SIGN IN With THOSE CREDENTIALS';
                                    loading = false;
                                  },
                                );
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.black),
                          ),
                          child: const Text('Login',
                          style: TextStyle(color: Colors.white),
                      
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          error,
                          style: const TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                        /*TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/admin_signup');
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
