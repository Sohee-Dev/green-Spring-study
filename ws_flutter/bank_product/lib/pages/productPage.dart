import 'package:bank_product/component/main_product.dart';
import 'package:flutter/material.dart';

class Productpage extends StatelessWidget {
  const Productpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _bulidAppBar(context),
      body: Container(child: ListView(children: [MainProduct()])),
    );
  }
}

AppBar _bulidAppBar(context) {
  return AppBar(
    title: Text(
      '아기천사 적금',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
    backgroundColor: const Color.fromARGB(255, 215, 25, 31),
    foregroundColor: Colors.white,
    centerTitle: true,
    leading: IconButton(onPressed:(){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back_ios_new_rounded),)

  );
}
