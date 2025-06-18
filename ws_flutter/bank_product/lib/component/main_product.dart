import 'package:flutter/material.dart';

class MainProduct extends StatelessWidget {
  const MainProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 600,
          width: MediaQuery.of(context).size.width,
          color: Colors.white60,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '아기천사 적금',
                  style: TextStyle(
                    color: Color.fromARGB(255, 215, 25, 31),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '자라나는 아이와 함께\n출산의 기쁨도 저축액도 쑥쑥!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 70),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '최대금리 연  ',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      TextSpan(
                        text: '7.00%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 215, 25, 31),
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
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        image: DecorationImage(
                          image: AssetImage('assets/images/calendar.gif'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        image: DecorationImage(
                          image: AssetImage('assets/images/money.gif'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        image: DecorationImage(
                          image: AssetImage('assets/images/baby.gif'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('12개월\n~36개월'),
                    Text('1만원\n~30만원'),
                    Text('출산\n우대'),
                  ],
                ),
                SizedBox(height: 50),

                Center(
                    child: SizedBox(
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 215, 25, 31),
                        ),
                        child: Text('가입하기', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

