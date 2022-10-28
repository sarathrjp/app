import 'package:flutter/material.dart';
class construction extends StatelessWidget {
  const construction({super.key});
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Under Construction"),
    ),
    body: Center(child: Image.network('https://www.clipartmax.com/png/middle/399-3990041_under-construction-tape-clipart-construction-logo-clip-under-construction-tape-clipart-construction.png'),
    ),
    );
  }
}
