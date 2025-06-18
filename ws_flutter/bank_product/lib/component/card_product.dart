import 'package:flutter/material.dart';


class ReadCardPage extends StatelessWidget {
  const ReadCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _bulidAppBar(context),
      body: CardProduct(),
    );
  }
}

AppBar _bulidAppBar(context) {
  return AppBar(
      title: Text(
        '딩딩 신용카드',
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


class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 600,
          width: MediaQuery.of(context).size.width,
          color: Colors.white60,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '딩딩 신용카드',
                  style: TextStyle(
                    color: Color.fromARGB(255, 215, 25, 31),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 18),
                Center(
                  child:
                  Column(
                    children: [
                      Text(
                        '주유, 외식 부터 영화,',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      Text(
                        '인터넷쇼핑, 통신 할인까지!',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Image.network('https://www.busanbank.co.kr/upload/bhp//vupload/FIMA/product/card/image/%EB%94%A9%EB%94%A9%EC%8B%A0%EC%9A%A9%EB%8C%80.png',
                    height: 200,),
                ),

                SizedBox(height: 40),

                Center(
                    child: SizedBox(
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 215, 25, 31),
                        ),
                        child: Text('간편신청', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                      ),
                    )
                ),
                SizedBox(height: 15,),
                Divider(),
                Row(

                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '연회비  ',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      TextSpan(
                        text: '국내, 글로벌 7천원VISA 1만원 / JCB 1만원 / MASTER 1만원',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      TextSpan(
                        text: '\n기본금리 연  ',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      TextSpan(
                        text: '1.9%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '  (12개월 세전)',
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

