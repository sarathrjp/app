import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
    title: Text("Home Screen"),
    ),
    body: Center(
    child: ListView(
        children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10),
                  child: new MaterialButton(
                    height: 100,
                    minWidth: 200,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("Book Doctor Appointment"),
                    onPressed: () => {Navigator.pushNamed(context, '/third')},
                    splashColor: Colors.greenAccent,
                  ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: new MaterialButton(
                    height: 100,
                    minWidth: 200,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("Book Lab Appointment"),
                    onPressed: () => {Navigator.pushNamed(context, '/third')},
                    splashColor: Colors.redAccent,
                  ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: new MaterialButton(
                  height: 100,
                  minWidth: 200,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: new Text("Order Medicines"),
                  onPressed: () => {Navigator.pushNamed(context, '/fourth')},
                  splashColor: Colors.redAccent,
                ),
              ),
          Padding(
            padding: EdgeInsets.all(10),
            child: new MaterialButton(
              height: 100,
              minWidth: 200,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: new Text("View Cart"),
              onPressed: () => {Navigator.pushNamed(context, 'checkout_screen')},
              splashColor: Colors.greenAccent,
            ),
          ),
            ],
          ),
        ),
    );
  }
}