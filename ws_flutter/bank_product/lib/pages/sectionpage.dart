import 'package:bank_product/component/card_product.dart';
import 'package:bank_product/pages/productPage.dart';
import 'package:flutter/material.dart';

import '../component/main_product.dart';

class Sectionpage extends StatelessWidget {
  const Sectionpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _sectionAppBar(),
      body: Container(child:
      ListView(
          children: [
            ListTile(
              title: Text('예금 / 적금', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: Text('아기천사 적금'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Productpage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: Text('아이사랑 적금'),
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: Text('저탄소 실천 적금'),
            ),
            SizedBox(height: 20,),
            ListTile(
              title: Text('카드', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            ListTile(
              leading: Icon(Icons.credit_card_rounded),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: Text('딩딩 신용카드'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReadCardPage()),
                );
              },
            ),
          ]
        )
      ),
    );
  }
}


AppBar _sectionAppBar(){
  return AppBar(
    title:
    Image.asset('assets/images/logo.PNG', width: 180,),
    backgroundColor: Colors.white,
    centerTitle: true,
  );
}