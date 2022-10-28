import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}


class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email='abc@gmail.com';
  String password='BITS';
  String name = 'uname';
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration '),
      ),
      backgroundColor: Colors.white,
      body: LoadingOverlay(
        isLoading: false,
        //inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Customer Name',
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                  height: 70,
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(30),
                    ),
                    child: const Text('Register'),
                    onPressed: () async{
                      setState(() {
                      });
                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if (newUser != null) {
                          showDialog(context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: Text("The User has been created"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {Navigator.pop(context, 'OK');
                                      FirebaseFirestore.instance.collection('customers')
                                    .add({'email':email, 'name':name});
                                      Navigator.pushNamed(context, '/');
                                      },
                                    child: const Text('OK'),
                                  )
                                ],
                              ),
                          );
                        }
                      } catch (error) {showDialog<String>(
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
                      };
                      },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}




