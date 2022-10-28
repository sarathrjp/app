import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:app/helper/list_products.dart';
import 'package:app/main.dart';

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




class MedView extends StatefulWidget{
  final double index;
  final String name;
  final String desc;
  final double quant;
  const MedView({Key? key,required this.index, required this.name, required this.desc, required this.quant}) : super(key: key);
  @override
  _medview createState() => _medview(index: this.index, name: this.name, desc: this.desc, quant: this.quant);
}



class _medview extends  State<MedView>{
  double index;
  String name;
  String desc;
  double quant;
  _medview({required this.index, required this.name, required this.desc, required this.quant});

  var items = ['1','2','3','4','5','6','7','8','9'];
  String? dropdownvalue = '0';

  Widget build(BuildContext){
    return MaterialApp(
        home: Scaffold(appBar: AppBar(
        title: Text("Medicine Overview"),
      ),
      body: Center(
        child:SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                child: Text("Medicine Name: ${name}",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,

                ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                child: (Text("Medicine Description: ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),

                ))
              ),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(20,5,20,20),
                child: Text(desc,
                style: TextStyle(
                  fontSize: 20
                )),
              ),


            ],
          )
        )
      ))
    );
  }
}

