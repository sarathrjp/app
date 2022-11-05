import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Carts{
  String? name;
  int? quantity;
  int? price;

  Carts({this.name, this.quantity, this.price});
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
  List<Carts> orders = [];
  _medview({required this.index, required this.name, required this.desc, required this.quant});

  int? qty;

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
                        SizedBox(height: 100,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                    labelText: 'Quantity',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {qty=int.parse(value);},
                                )),
                            SizedBox(width: 10,),
                            SizedBox(
                                width: 200,
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(30),
                                  ),
                                  child: const Text('Add To Cart'),
                                  onPressed: () {Navigator.pushNamed(context, '/fourth');
                                    setState(() {
                                      orders.add(Carts(name: name, quantity: qty, price: (qty as dynamic)*10));
                                      print(orders.length);
                                    });

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

