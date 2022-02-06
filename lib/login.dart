import 'package:data_base/components.dart';
import 'package:flutter/material.dart';

import 'home_layout.dart';

class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  bool _secureText=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body:
      SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.teal,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Form(
                  child: Column(
                    children: [
                      Center(
                        child: Text('LogIn',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              suffixIcon: Icon(
                                Icons.account_box,
                                color: Colors.teal,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:BorderRadius .circular(30)
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: passwordController,
                          keyboardType:TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.teal,
                              ),
                              suffixIcon:IconButton(

                                onPressed: (){
                                  setState(() {
                                    _secureText= !_secureText;
                                  });

                                },
                                icon: Icon(
                                  _secureText? Icons.visibility:Icons.visibility_off
                                  ,
                                ),
                              ) ,
                              border: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(30),
                              )
                          ),
                          obscureText: _secureText,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      defaultButton(
                        background: Colors.teal,
                          radius: 5,
                          function: (){
                        print('rana');},
                          text: 'Login')
                      // TextButton(onPressed:(){}, child:
                      // Text('You don\'t have account',
                      //   style: TextStyle(
                      //       color: Colors.teal
                      //   ),
                      // )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }
