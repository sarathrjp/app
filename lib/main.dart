//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:app/home.dart';
import 'package:app/UnderConstructionPage.dart';
import 'package:app/orders.dart';
import 'package:app/Registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/helper/list_products.dart';
//import 'package:app/helper/ProductView.dart';
import 'package:app/checkout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await uploadMedToFirebase(med);
  runApp(MaterialApp(
    title: 'Defining through Routes',
    initialRoute: '/',
    routes: {
      '/': (context) => const Login(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => const Home(),
      '/third': (context) => const construction(),
      '/fourth': (context) => orders(),
      'registration_screen': (context) => RegistrationScreen(),
      'checkout_screen': (context) => Checkout(),
//    '/fifth': (context) => ProductView(),
    },
  ));
}

final _auth = FirebaseAuth.instance;
String email = 'admin@gmail.com';
String password = 'admin';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('PharmApp Login'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Image.network('https://i.pinimg.com/originals/d6/f1/8d/d6f18dcdfc48ef9c283fa8e68a5c7a9e.png'
                    ,width: 200),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      onChanged: (value) {email = value;},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter your email'
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      obscureText: true,
                      onChanged: (value) {password = value;},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Container(
                      height: 70,
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(30),
                        ),
                        child: const Text('Log In'),
                        onPressed: () async{
                          try {final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                          if (user!= null){
                          Navigator.pushNamed(context, '/second');
                          }} catch (error){{showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Text(error.toString()),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                          print(error);
                          }
                          }

                        },
                      )),
                  Container(
                      height: 70,
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(30),
                        ),
                        child: const Text('Register'),
                        onPressed: () {Navigator.pushNamed(context, 'registration_screen');
                        },
                      )),


                ],
              ),
              ),
            )));
  }
}

