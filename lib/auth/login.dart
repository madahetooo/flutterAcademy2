import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/auth/register.dart';
import 'package:flutter_course/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Image.asset("assets/login.jpg"),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    label: Text("Email Address"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscureText,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _toggle();
                      },
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    label: Text("Password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Material(
                elevation: 5,
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      final _googleSignIn = GoogleSignIn();
                      final googleAccount = await _googleSignIn.signIn();
                      print(googleAccount!.email);
                      final googleCredential = await googleAccount.authentication;
                      final authCredential = GoogleAuthProvider.credential(
                        idToken: googleCredential.idToken,
                        accessToken: googleCredential.accessToken
                      );
                     final firebaseUser = await FirebaseAuth.instance.signInWithCredential(authCredential);
                     print(firebaseUser.user!.uid);
                     print(firebaseUser.user!.displayName);
                     print(firebaseUser.user!.email);
                     print(firebaseUser.user!.photoURL);
                     print(firebaseUser.user!.phoneNumber);
                     print(firebaseUser.user!.emailVerified);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have an account !?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: const Text(
                      "  Sign Up",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
