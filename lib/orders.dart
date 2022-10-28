import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:app/helper/list_products.dart';
import 'package:app/main.dart';
import 'package:app/helper/MedView.dart';

class orders extends StatefulWidget{
  const orders({super.key});
  @override
  State<orders> createState() => _orderstate();
}

class _orderstate extends State<orders> {
  String name= 'dummy';
  String desc = 'dummy';
  double quant = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicines Page"),
      ),
      body: Center(
        child: GridView.builder(
          itemCount: med.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                child: Container(
                  color: Colors.lightBlueAccent,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    med[index].Medicine_Name.toString(),
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 2,
                ),
              ),
              onDoubleTap: () {
                  setState(() {
                    FirebaseFirestore.instance.collection("Medicines").doc((index+1).toString()).get().then((value){
                      name = (value.data() as dynamic)["Medicine_Name"];
                      desc = (value.data() as dynamic)["Medicine_Description"];
                      quant = (value.data() as dynamic)["Quantity"];
                      print(value.data());
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedView(index: index+1, name: name, quant: quant,desc: desc,)));
                    });
                  });

                  print("Tapped on the container + $index");

              },
            );
            },
        )
      ),
    );
  }
}




