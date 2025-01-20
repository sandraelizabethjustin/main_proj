import 'package:flutter/material.dart';
import 'package:mn_proj_2/screens/admin/admin_signin.dart';
import 'package:mn_proj_2/screens/admin/admin_signup.dart';
import 'package:mn_proj_2/screens/user/user_signin.dart';
import 'package:mn_proj_2/screens/user/user_signup.dart';

class Authenticate extends StatefulWidget {
  final String isAdmin;  // Receive isAdmin flag from Wrapper
  const Authenticate({super.key,required this.isAdmin});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn=true;
  void toggleView(){
    setState(()=>showSignIn=!showSignIn);//reverse what it is currently it
  }
  @override
  Widget build(BuildContext context) {
    
      if (widget.isAdmin == 'admin') {
        if(showSignIn){
          return AdminSignIn(toggleView: toggleView);
        }
        else{
        return AdminSignUp(toggleView: toggleView);
        }
      }
      else {
        if(showSignIn){
          return UserSignIn(toggleView: toggleView);
        }
        else{
        return UserSignUp(toggleView: toggleView);
        }
      }
        //return showSignIn ? UserSignIn(toggleView: toggleView) : UserSignUp(toggleView: toggleView);
    
    /*return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isAdmin == 'admin' ? 'Admin Authentication' : 'User Authentication',
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent
      ),
      body: SingleChildScrollView(
          
          child: Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Conditionally display sign-in or sign-up forms based on widget.isAdmin
              if (widget.isAdmin == 'admin') 
                showSignIn ? AdminSignIn(toggleView: toggleView) : AdminSignUp(toggleView: toggleView)
              else 
                showSignIn ? UserSignIn(toggleView: toggleView) : UserSignUp(toggleView: toggleView),
            ],
          ),
        ),
      ),
    );*/
  }
}

    //return const Placeholder();  this was original
    // return Container(
    //   // child: Text('authenticate'),
    //   //child: Register(),
    //   child: SignIn(),
    // );
    // if (showSignIn) {//p11 toggle b/w
    //   //return SignIn(toggleView:toggleView);
    // }
    // else{
    //   //return Register(toggleView:toggleView);
    // }
  



/*class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn=true;//Toggle between signin and register pages
  bool isAdmin = true; // Tracks whether it's admin or user flow

  void toggleView(){//switch between signn and reg
    setState(()=>showSignIn=!showSignIn);//reverse what it is currently it
  }
  void selectRole(bool role) {
    setState(() => isAdmin = role); // Update the role (admin/user)
  }
  @override
  Widget build(BuildContext context) {
    if (showSignIn) {//p11 toggle b/w   in brew crew or only user
      return showSignIn?SignIn(toggleView:toggleView,isAdmin:isAdmin):Register(toggleView:toggleView,isAdmin:isAdmin);
    }
    else{ 
      return Scaffold(
        appBar: AppBar(title: Text("Login"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                selectRole(false); // Select "User" role
                toggleView(); // Navigate to SignIn/Register
              },
              child: Text("Sign in/Register as User"),
            ),
            ElevatedButton(
              onPressed: () {
                selectRole(true); // Select "Admin" role
                toggleView(); // Navigate to SignIn/Register
              },
              child: Text("Sign in/Register as Admin"),
            ),
          ],
        ),
      );
    }
  }
}*/

        //   ElevatedButton(
        //     onPressed: () {
        //       // Navigate to user signin
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => SignIn(isAdmin: false)),
        //       );
        //     },
        //     child: Text("Sign in as User"),
        //   ),
        //   ElevatedButton(
        //     onPressed: () {
        //       // Navigate to admin signin
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => SignIn(isAdmin: true)),
        //       );
        //     },
        //     child: Text("Sign in as Admin"),
        //   ),
        // ],
//       ),
//     );
//   }
// }
