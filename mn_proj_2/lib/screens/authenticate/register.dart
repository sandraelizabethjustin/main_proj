import 'package:mn_proj_2/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:mn_proj_2/services/auth.dart';
import 'package:mn_proj_2/shared/constant.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  final bool isAdmin;
  const Register({super.key, required this.toggleView,required this.isAdmin});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading=false;
  String email = '';
  String password = '';
  String error = '';
  String isAdmin='';
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        elevation: 0.0,
        title: //Text('Sign up to brew crew...'), //register
         Text(widget.isAdmin
                  ? 'Admin Register'
                  : 'User Register'), // Change title dynamically
        
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
    );
  }
}