/*
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        elevation: 0.0,
        title: const Text('Sign in to Brew Crew'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          child: const Text('Sign in anonymously'),
          onPressed: () async {
            try {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print('Error signing in');
              } else {
                print('User signed in');
                print('User ID: ${result.uid}');
              }
            } catch (e) {
              print('Error: $e');
            }
          },
        ),
      ),
    );
  }
}
*/
import 'package:mn_proj_2/services/auth.dart';
import 'package:mn_proj_2/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:mn_proj_2/shared/constant.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  final bool isAdmin;//for admin
  const SignIn({super.key, required this.toggleView,required this.isAdmin});
  // final Function toggleView; this is in old version
  // SignIn({this.toggleView})

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //bool isAdmin=false;

  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        elevation: 0.0,
        title: //Text('Sign in to DYNO...'),
        Text(widget.isAdmin
                  ? 'Admin Sign In'
                  : 'User Sign In'), // Change title dynamically
        
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
              foregroundColor:
                  Colors.black, // Optional: Icon color or ripple effect color
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        // child: ElevatedButton(  //for sign in ano
        //   child: Text('Sign in anonymously'),
        //   onPressed: () async{
        //     dynamic result=await _auth.signInAnon();
        //     if (result==null) {
        //       print('error signing in');
        //     }
        //     else{
        //       print('user signed in');
        //       print(result.uid);
        //     }
        //   },
        // ),
        //p10
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
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
                onPressed: () async {
                  //click on button
                  // print(email);
                  // print(password);
                  if (_formKey.currentState!.validate()) {
                    setState(() => loading = true);
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                          error = 'COULD NOT SIGN IN With THOSE CREDENTIALS';
                          loading=false;
                        },
                      );
                    } //else automatically goes to home page meaning correctly signed in
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.pink[400]),
                ),
                child: Text(
                  'Sign in',
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
    );
  }
}

