import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/google_signIn.dart';
import 'package:firebaseauth/screenHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return ScreenHome();
          }
          else if( snapshot.hasError){
           return Center(child: Text("error!"),);
          }
          return Center(
            child: ElevatedButton(onPressed: (){
              signInWithGoogle();
            }, child: Text("login with google")),
          );
        }
      ),
    );
  }
}