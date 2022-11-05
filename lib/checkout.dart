import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Checkout extends StatelessWidget{

  const Checkout({super.key});

  @override
  Widget build(BuildContext){
  return MaterialApp(
      home: Scaffold(appBar: AppBar(
        title: Text("Checkout Page"),
      ),
          body: Center(
              child:SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(20),
                        child: Text("Paracetamol: 5",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(20),
                          child: (Text("Gemer: 2 ",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),

                          ))
                      ),


                      SizedBox(height: 100,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(
                              width: 200,
                              height: 60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(30),
                                ),
                                child: const Text('Buy Now'),
                                onPressed: () {
                                  },
                              ))
                        ],
                      )

                    ],
                  )
              )
          ))
  );
}
}
