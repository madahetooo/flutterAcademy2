import 'package:flutter/material.dart';
import 'package:flutter_course/home_page.dart';
import 'package:flutter_course/register.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  )
                ),
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    label: Text("Password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 40.0,),
              Material(
                elevation: 5,
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  child: Text("Login",
                  style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    }
                ),

              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have an account !?"),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));

                    },
                    child: Text("  Sign Up",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}