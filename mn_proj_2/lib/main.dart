// import 'package:mn_proj_2/screens/admin/admin_signin.dart';
// import 'package:mn_proj_2/screens/admin/admin_signup.dart';
// import 'package:mn_proj_2/screens/user/user_signin.dart';
// import 'package:mn_proj_2/screens/user/user_signup.dart';
// import 'package:mn_proj_2/screens/home/adminhome.dart';
// import 'package:mn_proj_2/screens/home/home.dart';
//import 'package:mn_proj_2/screens/authenticate/sign_in.dart';


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:mn_proj_2/screens/common/intropage.dart';
import 'package:provider/provider.dart';
import 'package:mn_proj_2/services/auth.dart';
import 'package:mn_proj_2/models/myuser.dart';
//import 'package:mn_proj_2/screens/common/wrapper.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().user,
      child:  MaterialApp(
        home: IntroPage(),
      ),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => LandingPage(),
        // },
    );
    
  }
}



/*import 'package:flutter/material.dart';
import 'package:mn_proj_2/landing.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        // '/admin_login': (context) => AdminLogin(),
        // '/admin_signup': (context) => AdminSignup(),
        // '/admin_home': (context) => AdminHome(),
        // '/user_login': (context) => UserLogin(),
        // '/user_home': (context) => UserHome(),
      },
    );
  }
}
*/
