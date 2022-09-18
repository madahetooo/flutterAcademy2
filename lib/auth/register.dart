import 'package:flutter/material.dart';
import 'package:flutter_course/home_page.dart';
import 'package:flutter_course/auth/login.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  bool _obscureText2 = true;

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
                    prefixIcon: Icon(Icons.person),
                    label: Text("Full Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    label: Text("Email Address"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscureText2,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: (){
                        _toggle2();
                      },
                      icon: Icon(_obscureText2 ? Icons.visibility_off : Icons.visibility),
                    ),
                    label: Text("Password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              const  SizedBox(height: 20.0,),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscureText,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: (){
                        _toggle();
                      },
                      icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                    ),
                    label: Text("Confirm Password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              const SizedBox(height: 40.0,),
              Material(
                elevation: 5,
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                    child: Text("Register",
                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    }
                ),

              ),
              const  SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have an account !?"),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

                    },
                    child: const Text("  Login",
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
  void _toggle(){
    setState((){
      _obscureText = !_obscureText;
    });
  }
  void _toggle2(){
    setState((){
      _obscureText2 = !_obscureText2;
    });
  }
}
